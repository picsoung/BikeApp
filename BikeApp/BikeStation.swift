//
//  BikeStation.swift
//  BikeApp
//
//  Created by Nicolas Grenie on 6/11/14.
//  Copyright (c) 2014 Nicolas Grenie. All rights reserved.
//

import Foundation

class BikeStation{
    var name: String
    var city: String
    var availableDocks: Int
    var latitude: Double
    var longitude: Double
    var availableBikes: Int
    var distance: Double
    
    init(name: String!, city: String!, availableDocks: Int!, latitude: Double!, longitude: Double!,availableBikes: Int!, distance: Double!) {
        self.name = name
        self.city = city
        self.availableDocks = availableDocks
        self.latitude = latitude
        self.longitude = longitude
        self.availableBikes = availableBikes
        self.distance = distance
    }
    
    class func stationsWithJSON(allResults: NSArray) -> [BikeStation] {
        
        // Create an empty array of Albums to append to from this list
        var stations = [BikeStation]()
        
        // Store the results in our table data array
        if allResults.count>0 {
            
            // Sometimes iTunes returns a collection, not a track, so we check both for the 'name'
            for result in allResults {
                
                var name = result["stationName"] as? String
                var longitude = result["longitude"] as? Double
                var latitude = result["latitude"] as? Double
                var city = result["city"] as? String
                var distance = result["distance"] as? Double
                var availableBikes = result["availableBikes"] as? Int
                var availableDocks = result["availableDocks"] as? Int
                
                var newStation = BikeStation(name: name!, city: city!, availableDocks:availableDocks!,latitude: latitude!, longitude: longitude!, availableBikes: availableBikes!, distance: distance!)
                stations.append(newStation)
            }
        }
        return stations
    }

}