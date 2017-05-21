//
//  DateUtilities.swift
//  WeatherForecast
//
//  Created by ITRMG on 2017-21-05.
//  Copyright © 2017 djrecker. All rights reserved.
//

import Foundation

class DateUtiltiies {
    
    static func formatDate(dateString: String)-> String?{

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        // convert your string to date
        let yourDate = formatter.date(from: dateString)
        formatter.dateFormat = "dd-MMM-yyyy HH:mm:ss"
        
        var formattedStringDate : String?
        
        if let yourDate = yourDate {
            
            formattedStringDate = formatter.string(from: yourDate)
        }

        return formattedStringDate

    }
}
