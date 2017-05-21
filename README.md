# Open Weather API : iOS Integration

This project contains simple iOS integration of Open Weather API with swift 3.1

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

OS : macOS Sierra : 10.12.4 
Xcode : 8.3.1 
Swfit : 3.1 


### Installing

Clone the repo 
Double click on the WeatherForecast.xcodeproj and open with Xcode 8.3.1 only using Swift 3.1 

## Running the tests

Use standard Apple Xcode XC test framework to run the test 
Use Command + U to run the rest 
The unit test are writing inside WeatherForecastTests.swift

### Unit Test Details

testFormatDate : 
1. will test the date format to string from string input.
2. retunrs nil if unwated data is the input. 

testWeatherListLoaded
1. Will test if the data loaded inside the WeatherService.json is not nil. 

testParseData
1. Will test all the parsing features of the code. 
2. Will test if the weatherCahce / weather Data model contains the expected data. 

### And coding style tests

1. use camel case for variable names 
2. use swifty way of function declaration 
3. all constants should be capitalised 
4. all optional should be safely unwrapped using if lets to avoid crashes. 
5. 3 Tier Architecture : 
    1. API Services : responsible for API calls and parsing of json / raw data from open weather API services. 
    2. Data Manager : responsible for data manuputaion methods and loading stubbed data if required. 
    3. Data Model : responsible for storing weather data model. 
    4. view :- responsbile for presentation of views
    5. view controller :- responsible for binding views and data models together.  

NSNotification is used for updated data models / views once API services returns back successful data.  

Singleton Objects for caching data 

## Deployment

Simple Xcode Run using iOS simlutors on iPhones only. 

## Built With
Xcode 8.3.1 

## Versioning
1.0 

## Authors

djrecker

