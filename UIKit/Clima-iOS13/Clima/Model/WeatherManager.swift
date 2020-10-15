//
//  WeatherManager.swift
//  Clima
//
//  Created by Gary Chen on 10/9/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager{
    //http request gets denied; change to https
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=32eb8509b267d0aab5feaafa395d6213&units=imperial"
    var delegate: WeatherManagerDelegate?

    func fetchWeather(cityName: String){
        var urlString = "\(weatherURL)&q=\(cityName)"
        
        urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        //this allows all characters to be used in the URL in the function performRequest()
        
        performRequest(with: urlString)
    }
    
    func fetchWeather(_ lat: CLLocationDegrees, _ lon: CLLocationDegrees){
        let urlString = "\(weatherURL)&lat=\(lat)&lon=\(lon)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String){
        //create URL
        if let url = URL(string: urlString){
            
            //create a session
            let session = URLSession(configuration: .default)
            
            //assign a task to the session
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    //print and exit when there is error
                    return
                }

                //inspect what data/error the server sent back
                if let safeData = data{
                    if let weather = self.parseJSON(safeData){
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                    //calling a function inside a closure is a bit confusing
                }
            }
            //start the task; when creating a task, it always initialized in a suspended state; see definition
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            //what??
             
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let weather = WeatherModel(conditionID: id, cityName: name, temperature: temp)
            return weather
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
