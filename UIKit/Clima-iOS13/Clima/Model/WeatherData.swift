//
//  WeatherData.swift
//  Clima
//
//  Created by Gary Chen on 10/9/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

//Codable = Decodable + Encodable
struct WeatherData: Decodable{
    let name: String
    let main: Main
    let weather: [Weather]
}

//in order to call decodedData.main.temp from JSON object from WeatherManager.swift
struct Main: Decodable{
    let temp: Double
    //must match the names from JSON object
}

struct Weather: Decodable{
    let id: Int
}
