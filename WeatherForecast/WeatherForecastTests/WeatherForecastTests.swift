//
//  WeatherForecastTests.swift
//  WeatherForecastTests
//
//  Created by ITRMG on 2017-21-05.
//  Copyright © 2017 djrecker. All rights reserved.
//

import XCTest
@testable import WeatherForecast

class WeatherForecastTests: XCTestCase {
    
    var weatherList = [Weather]()
    
    override func setUp() {
        
        AppConstants.isSTUBBED = true //Load Stubbed JSON data for unit test.
        WeatherDetailsDataManager.sharedObject.populateData()
    
    }
    
    func testFormatDate(){
        
        let sampleDate1 = "2017-05-22 15:00:00"
        let sampleDate2 = "2017-10-22 09:00:00"
        let sampleDate3 = "2017-15-22 15:00:00"
        let sampleDate4 = "2017-15-22 --------15:00:00"
        let sampleDate5 = ""
        let sampleDate6 = "test"
        let sampleDate7 = "22-May-2017 15:00:00"
        
        XCTAssertEqual(DateUtiltiies.formatDate(dateString: sampleDate1), "22-May-2017 15:00:00", "formatDate for sampleDate1 not matching")
        XCTAssertEqual(DateUtiltiies.formatDate(dateString: sampleDate2), "22-Oct-2017 09:00:00", "formatDate for sampleDate2 not matching")
        XCTAssertNil(DateUtiltiies.formatDate(dateString: sampleDate3), "formatDate for sampleDate3 not nil")
        XCTAssertNil(DateUtiltiies.formatDate(dateString: sampleDate4), "formatDate for sampleDate4 not nil")
        XCTAssertNil(DateUtiltiies.formatDate(dateString: sampleDate5), "formatDate for sampleDate5 not nil")
        XCTAssertNil(DateUtiltiies.formatDate(dateString: sampleDate6), "formatDate for sampleDate6 not nil")
        XCTAssertNil(DateUtiltiies.formatDate(dateString: sampleDate7), "formatDate for sampleDate7 not nil")
        
    }
    
    func testWeatherListLoaded(){
        
        let api = WeatherService()
        WeatherService.json = nil
        api.loadWeatherList(completion: nil)
        
        XCTAssertNil(WeatherService.json, "WeatherService.json is not nil")
        
    }
    
    func testParseData(){
        
        if let cachedData = WeatherDetailsDataManager.sharedObject.cachedData(){
            self.weatherList = cachedData
        }
        
        XCTAssertNotNil(WeatherDetailsDataManager.sharedObject.cachedData(), "Cached Data is nil")
        XCTAssertEqual(self.weatherList.count, 5,  "Weather List Count does not match")
        
        for (weatherIndex, aWeather) in self.weatherList.enumerated() {
            
            switch weatherIndex {
            
            case 0:
                
                XCTAssertEqual(aWeather.day, "19-Apr-2017 21:00:00", "Weather Object date does not match")
                XCTAssertEqual(aWeather.maxTemperature, "06", "Weather Object Max Temperature does not match")
                XCTAssertEqual(aWeather.minimumTemperature, "06", "Weather Object Min Temperature does not match")
                XCTAssertEqual(aWeather.suggestion, CLEAR_SKY_SUGGESTION , "Weather Object Suggestion does not match")
                XCTAssertEqual(aWeather.weatherType, "clear sky", "Weather Object Weather Type does not match")
                XCTAssertEqual(aWeather.currentTemperature, "06", "Weather Object Current Temperature does not match")
                break
            
            case 1:
                
                XCTAssertEqual(aWeather.day, "20-Apr-2017 21:00:00", "Weather Object date does not match")
                XCTAssertEqual(aWeather.maxTemperature, "11", "Weather Object Max Temperature does not match")
                XCTAssertEqual(aWeather.minimumTemperature, "11", "Weather Object Min Temperature does not match")
                XCTAssertEqual(aWeather.suggestion, RAIN_SUGGESTION , "Weather Object Suggestion does not match")
                XCTAssertEqual(aWeather.weatherType, "light rain", "Weather Object Weather Type does not match")
                XCTAssertEqual(aWeather.currentTemperature, "11", "Weather Object Current Temperature does not match")
                break
            
            case 2:
                XCTAssertEqual(aWeather.day, "21-Apr-2017 21:00:00", "Weather Object date does not match")
                XCTAssertEqual(aWeather.maxTemperature, "13", "Weather Object Max Temperature does not match")
                XCTAssertEqual(aWeather.minimumTemperature, "13", "Weather Object Min Temperature does not match")
                XCTAssertEqual(aWeather.suggestion, CLOUDS_SUGGESTION , "Weather Object Suggestion does not match")
                XCTAssertEqual(aWeather.weatherType, "scattered clouds", "Weather Object Weather Type does not match")
                XCTAssertEqual(aWeather.currentTemperature, "13", "Weather Object Current Temperature does not match")
                break
            
            case 3:
                XCTAssertEqual(aWeather.day, "22-Apr-2017 21:00:00", "Weather Object date does not match")
                XCTAssertEqual(aWeather.maxTemperature, "10", "Weather Object Max Temperature does not match")
                XCTAssertEqual(aWeather.minimumTemperature, "10", "Weather Object Min Temperature does not match")
                XCTAssertEqual(aWeather.suggestion, CLEAR_SKY_SUGGESTION , "Weather Object Suggestion does not match")
                XCTAssertEqual(aWeather.weatherType, "clear sky", "Weather Object Weather Type does not match")
                XCTAssertEqual(aWeather.currentTemperature, "10", "Weather Object Current Temperature does not match")
                break
            
            case 4:
                XCTAssertEqual(aWeather.day, "23-Apr-2017 21:00:00", "Weather Object date does not match")
                XCTAssertEqual(aWeather.maxTemperature, "14", "Weather Object Max Temperature does not match")
                XCTAssertEqual(aWeather.minimumTemperature, "14", "Weather Object Min Temperature does not match")
                XCTAssertEqual(aWeather.suggestion, CLOUDS_SUGGESTION , "Weather Object Suggestion does not match")
                XCTAssertEqual(aWeather.weatherType, "scattered clouds", "Weather Object Weather Type does not match")
                XCTAssertEqual(aWeather.currentTemperature, "14", "Weather Object Current Temperature does not match")
                break
           
            default:
                print("do nothing")
            }
            
            
        }
        
    }
    
    
    
    
}
