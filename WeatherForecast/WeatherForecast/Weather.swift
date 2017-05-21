//
//  Weather.swift
//  WeatherForecast
//
//  Created by ITMRG : @djrecker on 2017-21-05.
//  Copyright © 2017 ITMRG : @djrecker. All rights reserved.
//

import Foundation

class Weather {
    
    var suggestion : String
    var weatherType : String
    var maxTemperature : String
    var minimumTemperature : String
    var day : String
    var currentTemperature : String
    
    init(suggestion: String, weatherType: String, maxTemperature : String, minimumTemperature : String, day : String, currentTemperature : String){
        
        self.suggestion = suggestion
        self.weatherType = weatherType
        self.maxTemperature = maxTemperature
        self.minimumTemperature = minimumTemperature
        self.day = day
        self.currentTemperature = currentTemperature
    }
}
