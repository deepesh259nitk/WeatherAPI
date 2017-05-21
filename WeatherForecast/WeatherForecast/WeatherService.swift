//
//  ProductAPI.swift
//  WeatherForecast
//
//  Created by ITMRG : @djrecker on 2017-21-05.
//  Copyright © 2017 ITMRG : @djrecker. All rights reserved.
//

import Foundation

let WeatherMainKey = "main"
let WeatherListKey = "list"
let WeatherKey = "weather"
let WeatherDescriptionKey = "description"
let WeatherClearKey = "clear"
let WeatherRainKey = "rain"
let WeatherCloudsKey = "clouds"
let WeatherDateKey = "dt_txt"
let WeatherMinTempKey = "temp_min"
let WeatherMaxTempKey = "temp_max"
let WeatherCurrentTempKey = "temp"

class WeatherService {
    
    static var json : JSONDict?
    
    func loadWeatherList(completion: ((AnyObject) -> Void)!) {
        
        let session = URLSession.shared
        if let productsUrl = NSURL(string: OPEN_WEATHER_API_URL_LOCATION){
            
            let task = session.dataTask(with: productsUrl as URL){
                (data, response, error) -> Void in
                
                do {
                    let JSON = try JSONSerialization.jsonObject(with: data!, options:JSONSerialization.ReadingOptions(rawValue: 0))
                    guard let JSONDictionary = JSON as? JSONDict else {
                        print("Not a Dictionary")
                        return
                    }
        
                    WeatherService.json = JSONDictionary
                    NotificationCenter.default.post(name: WeatherNotificationConstants.WeatherListRefreshedNotification, object: nil)
                    
                }
                catch let JSONError as NSError {
                    print("\(JSONError)")
                }
                
            }
            
            task.resume()
        }
    }
    
    static func parseData(jsonData : JSONDict)-> [Weather]? {
        
        var weathers = [Weather]()
        
        if let weatherList = jsonData[WeatherListKey] as? NSArray {
            
            var index = 0
            
            for eachList in weatherList {
                
                if (index == 0 || index % 8 == 0 ) {
                    
                    var description = ""
                    var suggestion = ""
                    
                    let eachDictList = eachList as? JSONDict
                    let mainWeatherDict = eachDictList?[WeatherMainKey] as? JSONDict
                    
                    if let weatherDetails = eachDictList?[WeatherKey] as? JSONDicts, let day = eachDictList?[WeatherDateKey],let minTemp = mainWeatherDict?[WeatherMinTempKey], let maxTemp = mainWeatherDict?[WeatherMaxTempKey], let currentTemp = mainWeatherDict?[WeatherCurrentTempKey] {
                        
                        for eachDetails in weatherDetails {
                            
                            if let aDesc = eachDetails[WeatherDescriptionKey] {
                                description = aDesc as! String
                                
                                if description.contains(WeatherClearKey) {
                                    suggestion = CLEAR_SKY_SUGGESTION
                                } else if description.contains(WeatherRainKey){
                                    suggestion = RAIN_SUGGESTION
                                } else if description.contains(WeatherCloudsKey){
                                    suggestion = CLOUDS_SUGGESTION
                                }
                            }
                        }
                       
                        if let day = day as? String, let minTemp = minTemp as? Int, let maxTemp = maxTemp as? Int, let currentTemp = currentTemp as? Int, let result = DateUtiltiies.formatDate(dateString: day) {
                         
                            print(result)
                            
                            let weatherObject = Weather(suggestion: suggestion, weatherType: description, maxTemperature: String(format: "%0.2d", maxTemp), minimumTemperature: String(format: "%0.2d", minTemp), day: result, currentTemperature: String(format: "%0.2d", currentTemp))
                            
                            weathers.append(weatherObject)
                            
                        }
                    }
                }
                
                index = index + 1
            }
            
        }
        
        return weathers
    }
}
