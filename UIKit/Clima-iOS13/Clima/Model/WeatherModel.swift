//
//  WeatherModel.swift
//  Clima
//
//  Created by Gary Chen on 10/9/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel{
    let conditionID: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {String(format: "%0.1f", temperature)}
    //temperatureString is of type String and it is initialized in {...}
    
    var conditionName: String{
        switch conditionID{
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.min"
        case 801...804:
            return "cloud"
        default:
            return "nil"
        }
    }
}
