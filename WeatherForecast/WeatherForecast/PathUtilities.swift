//
//  PathUtilities.swift
//  WeatherForecast
//
//  Created by ITMRG : @djrecker on 2017-21-05.
//  Copyright © 2017 ITMRG : @djrecker. All rights reserved.
//

import Foundation


typealias JSONDict = [String : AnyObject]
typealias JSONDicts = [JSONDict]

class PathUtilities {
    
    static func find(resourceNamed : String, ofType type : String ) -> NSData?
    {
        if let path = Bundle.main.path(forResource: resourceNamed, ofType: type)
        {
            do
            {
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                return jsonData
            }
            catch {}
        }
        
        return nil
    }
    
    static func findJSON(resourceNamed : String) -> JSONDict?
    {
        if let jsonData = self.find(resourceNamed: resourceNamed, ofType: "json")
        {
            do
            {
                if let jsonResult : JSONDict = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions(rawValue : 0)) as? JSONDict
                { return jsonResult }
                
            }
            catch {}
        }
        
        return nil
    }

}
