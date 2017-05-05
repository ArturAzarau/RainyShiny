//
//  Location.swift
//  RainyShiny
//
//  Created by Artur Azarov on 05.05.17.
//  Copyright © 2017 Artur Azarov. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var longitude: Double!
    var latitude: Double!
}
