//
//  CurrentWeather.swift
//  RainyShiny
//
//  Created by Artur Azarov on 02.05.17.
//  Copyright © 2017 Artur Azarov. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    
    private var _cityName: String!
    private var _date : String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    
    var cityName: String {
        return _cityName ?? ""
    }
    
    var date: String {
        guard (_date) != nil else {
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
    
    var currentTemp: Double {
        return _currentTemp ?? 0.0
    }
}
