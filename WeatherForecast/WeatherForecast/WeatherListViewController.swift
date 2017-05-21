//
//  WeatherListViewController.swift
//  WeatherForecast
//
//  Created by ITRMG on 2017-21-05.
//  Copyright © 2017 djrecker. All rights reserved.
//

import UIKit

class WeatherListViewController: UITableViewController {
    
    @IBOutlet weak var weatherListTableView: UITableView!
    
    var weatherList = [Weather]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        WeatherDetailsDataManager.sharedObject.requestData()
        
        NotificationCenter.default.addObserver(self, selector: #selector(WeatherListViewController.weatherListRefreshed(notification:)), name: WeatherNotificationConstants.WeatherListRefreshedNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weatherList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : WeatherCell  = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)  as! WeatherCell
        
        let weather = weatherList[indexPath.row]
        
        
        /*  Commented for future implementation ( set background images for ui ).
         
        if weather.weatherType.contains(WeatherClearKey) {
            
            /*let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: cell.frame.width, height: cell.frame.height))
            let image = UIImage(named: "LondonClearBG")
            imageView.image = image
            cell.addSubview(imageView)*/
            
            cell.backGroundImage.image = UIImage(named: "LondonClearBG")
            
        }
        
        if weather.weatherType.contains(WeatherCloudsKey) {
            
            /*let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: cell.frame.width, height: cell.frame.height))
            let image = UIImage(named: "LondonCloudyBG")
            imageView.image = image
            cell.addSubview(imageView)
             */
            cell.backGroundImage.image =  UIImage(named: "LondonCloudyBG")
        }
        
        if weather.weatherType.contains(WeatherRainKey) {
            
           /* let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: cell.frame.width, height: cell.frame.height))
            let image = UIImage(named: "LondonRainBG")
            imageView.image = image
            cell.addSubview(imageView)
            */
            cell.backGroundImage.image = UIImage(named: "LondonRainBG")
        }
        */
        
        if indexPath.row == 0 {
            cell.day.text = "Today"
        } else {
            cell.day.text = weather.day
        }
        
        cell.maxTemperature.text = weather.maxTemperature + "°"
        cell.minimumTemperature.text = weather.minimumTemperature + "°"
        cell.suggestion.text = weather.suggestion
        cell.weatherType.text = weather.weatherType
        cell.currentTemperature.text = weather.currentTemperature + "°C"
        
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero

        
        return cell
    }
    
    func weatherListRefreshed(notification : NSNotification){
        
        WeatherDetailsDataManager.sharedObject.populateData()
        
        if let weatherCahce = WeatherDetailsDataManager.sharedObject.cachedData() {
            self.weatherList = weatherCahce
        }
        
        DispatchQueue.main.async() {
            
            self.weatherListTableView.reloadData()
        }
        
    }


}
