//
//  BikeStation.swift
//  BikeApp
//
//  Created by Nicolas Grenie on 6/11/14.
//  Copyright (c) 2014 Nicolas Grenie. All rights reserved.
//

import Foundation

class BikeStation{
    var name: String?
    var city: String?
    var availableDocks: Int?
    var latitude: Double?
    var longitude: Double?
    var availableBikes: Int?
    var distance: Double?
    
    init(name: String!, city: String!, availableDocks: Int!, latitude: Double!, longitude: Double!,availableBikes: Int!, distance: Double!) {
        self.name = name
        self.city = city
        self.availableDocks = availableDocks
        self.latitude = latitude
        self.longitude = longitude
        self.availableBikes = availableBikes
        self.distance = distance
    }

}