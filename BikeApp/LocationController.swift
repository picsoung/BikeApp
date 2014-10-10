//
//  LocationController.swift
//  BikeApp
//
//  Created by Nicolas Grenie on 6/11/14.
//  Copyright (c) 2014 Nicolas Grenie. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationControllerProtocol {
    func didReceiveLocationResults(location: CLLocation)
}

class LocationController: NSObject{
    var geoLoc: [AnyObject] = []
    var delegate: LocationControllerProtocol?
    let locationManager: CLLocationManager = CLLocationManager()
    var location: CLLocation = CLLocation()
    
    init(delegate: LocationControllerProtocol) {
      self.delegate = delegate
      self.locationManager.distanceFilter = 30
      self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func getLocation(){
        println("GET LOCATION CALLED")
        locationManager.distanceFilter = 30
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    //#pragma mark - CLLocationManagerDelegate
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        println(locations)
        self.location = locations[0] as CLLocation
        self.locationManager.stopUpdatingLocation()
        self.delegate?.didReceiveLocationResults(self.location)
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println(error)
    }
}
