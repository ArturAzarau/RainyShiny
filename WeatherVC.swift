//
//  WeatherVC.swift
//  RainyShiny
//
//  Created by Artur Azarov on 24.04.17.
//  Copyright © 2017 Artur Azarov. All rights reserved.
//

import UIKit
import Alamofire

class WeatherVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather = CurrentWeather()
    var forecasts = [Forecast]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        currentWeather.downloadWeatherDetails {
            self.updateMainUI()
        }
        downloaForecastData {
            self.tableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
            let forecast = forecasts[indexPath.row]
            cell.configureCell(weather: forecast)
            return cell
        } else {
        return WeatherCell()
        }
    }
    
    func updateMainUI(){
        dateLabel.text = currentWeather.date
        currentTempLabel.text = String(currentWeather.currentTemp) + "°"
        currentWeatherTypeLabel.text = currentWeather.weatherType
        locationLabel.text = currentWeather.cityName
        currentWeatherImage.image = currentWeather.image
    }
    
    func downloaForecastData(completed: @escaping DownloadComplete){
        let forecastURL = URL(string: FORECAST_URL)
        Alamofire.request(forecastURL!).responseJSON{ response in
            if let result = response.result.value as? [String: AnyObject] {
                if let forecastList = result["list"] as? [[String: AnyObject]] {
                    for object in forecastList {
                        let forecast = Forecast(weatherDict: object)
                        self.forecasts.append(forecast)
                        print(self.forecasts)
                    }
                }
            }
            print(self.forecasts.count)
            completed()
        }
    }
}
