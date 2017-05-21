//
//  DataSource.swift
//  WeatherForecast
//
//  Created by ITMRG : @djrecker on 2017-21-05.
//  Copyright © 2017 ITMRG : @djrecker. All rights reserved.
//

import Foundation

class WeatherDetailsDataManager {
    
    private var debugFileName = "weather"
    static let sharedObject = WeatherDetailsDataManager()
    var weatherCahce : [Weather]?
    
    func requestData(){
        
        let api = WeatherService()
        api.loadWeatherList(completion: nil)
        
        if WeatherService.json != nil {
            self.populateData()
        }
    
    }
    
    func populateData(){
        
        if AppConstants.isSTUBBED {
        
            if let stubbedData = self.debugSettings(){
                self.weatherCahce = WeatherService.parseData(jsonData: stubbedData)
            }
            
        } else {
            
            if let jsonData = WeatherService.json {
                self.weatherCahce = WeatherService.parseData(jsonData: jsonData)
            }
        }
    }
    
    func cachedData()-> [Weather]?{
        
        if let weatherCahce = weatherCahce {
            return weatherCahce
        }
        
        return nil
        
    }
    
    func debugSettings()-> JSONDict?
    {
        if let dict = PathUtilities.findJSON(resourceNamed: debugFileName)
        {
            return dict
        }
        return nil
    }
    
}


