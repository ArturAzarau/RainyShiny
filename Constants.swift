//
//  Constants.swift
//  RainyShiny
//
//  Created by Artur Azarov on 05.05.17.
//  Copyright © 2017 Artur Azarov. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "a7b459ddacb533843e9524b752681874"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Float(Location.sharedInstance.latitude))&lon=\(Float(Location.sharedInstance.longitude))&appid=a7b459ddacb533843e9524b752681874"
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Float(Location.sharedInstance.latitude))&lon=\(Float(Location.sharedInstance.longitude))&appid=a7b459ddacb533843e9524b752681874"
