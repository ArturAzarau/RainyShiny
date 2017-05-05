//
//  CurrentWeather.swift
//  RainyShiny
//
//  Created by Artur Azarov on 02.05.17.
//  Copyright © 2017 Artur Azarov. All rights reserved.
//

import UIKit
import Alamofire
import Foundation

class CurrentWeather {
    
    private var _cityName: String!
    private var _date : String!
    private var _weatherType: String!
    private var _currentTemp: Int!
    
    var cityName: String {
        return _cityName ?? ""
    }
    
    var date: String {
        guard (_date) == nil else {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        _date = "Today,\(currentDate)"
        return _date
    }
    
    var weatherType: String {
        return _weatherType ?? ""
    }
    
    var currentTemp: Int {
        return _currentTemp ?? 0
    }
    
    var image: UIImage {
        return UIImage(named: weatherType)!
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)
        Alamofire.request(currentWeatherURL!).responseJSON{ response in
            if let json = response.result.value as? [String: AnyObject]{
                guard let name = json["name"] as? String else { return }
                self._cityName = name.capitalized
                
                guard let weather = json["weather"] as? [[String: AnyObject]],
                        let weatherType = weather[0]["main"] as? String? else { return }
                self._weatherType = weatherType
                
                guard let main = json["main"] as? [String: AnyObject],
                    let temp = main["temp"] as? Double else { return }
                
                self._currentTemp = temp.kelvinToCelsius
                
                print(self._currentTemp, self._weatherType, self._cityName)
                completed()
            } else {
                print("download failed")
            }
        }
    }
}

extension Double {
    var kelvinToCelsius: Int {
        return Int(self - 273.15)
    }
}
