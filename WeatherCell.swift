//
//  WeatherCell.swift
//  RainyShiny
//
//  Created by Artur Azarov on 05.05.17.
//  Copyright © 2017 Artur Azarov. All rights reserved.
//

import Foundation
import UIKit
class WeatherCell: UITableViewCell {
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    
    func configureCell(weather: Forecast){
        highTempLabel.text = weather.highTemp
        lowTempLabel.text = weather.lowTemp
        weatherTypeLabel.text = weather.weatherType
        dayLabel.text = weather.date
        weatherIcon.image = weather.weatherIcon
    }
}
