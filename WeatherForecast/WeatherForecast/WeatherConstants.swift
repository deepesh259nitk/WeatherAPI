//
//  WeatherConstants.swift
//  WeatherForecast
//
//  Created by ITRMG on 2017-21-05.
//  Copyright © 2017 djrecker. All rights reserved.
//

import Foundation

// open weather API details 

let API_KEY = "9ab980154b2797d68656609717cbb4e6"

let OPEN_WEATHER_API_URL_LOCATION = "http://api.openweathermap.org/data/2.5/forecast?q=London,uk&mode=JSON&APPID=\(API_KEY)&units=metric"

// Suggestions

let CLEAR_SKY_SUGGESTION = "Please carry your Sunglasses"
let CLOUDS_SUGGESTION    = "Please carry your Jackets"
let RAIN_SUGGESTION      = "Please carry your Umberella / RainCoats"
