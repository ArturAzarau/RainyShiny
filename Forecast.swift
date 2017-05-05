//
//  Forecast.swift
//  RainyShiny
//
//  Created by Artur Azarov on 05.05.17.
//  Copyright © 2017 Artur Azarov. All rights reserved.
//

import Foundation
import UIKit

class Forecast {
    private var _lowTemp: String!
    private var _highTemp: String!
    private var _weatherType: String!
    private var _weatherIcon: UIImage!
    private var _date: String!
    
    var lowTemp:String{
        return _lowTemp ?? ""
    }
    
    var highTemp:String{
        return _highTemp ?? ""
    }
    
    var weatherType:String{
        return _weatherType ?? ""
    }
    
    var weatherIcon:UIImage{
        return UIImage(named: weatherType) ?? UIImage()
    }
    
    var date:String{
        return _date ?? ""
    }
    
    init(weatherDict: [String: AnyObject]){
        if let tempDict = weatherDict["temp"] as? [String: AnyObject] {
            if let lowTemp = tempDict["min"] as? Double {
                _lowTemp = String(lowTemp.kelvinToCelsius) + "°"
            }
            
            if let highTemp = tempDict["max"] as? Double {
                _highTemp = String(highTemp.kelvinToCelsius) + "°"
            }
        }
        
        if let weather = weatherDict["weather"] as? [[String: AnyObject]]{
            if let weatherType = weather[0]["main"] as? String {
                _weatherType = weatherType
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
        }
    }
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
