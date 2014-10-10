//
//  ViewController.swift
//  BikeApp
//
//  Created by Nicolas Grenie on 6/10/14.
//  Copyright (c) 2014 Nicolas Grenie. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, APIControllerProtocol  {
    
    var bikeAPI: BikeAPIController = BikeAPIController()
    var stations: Array<BikeStation> = []
    let kCellIdentifier: String = "StationResultCell"
    let appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
//        fatalError("init(coder:) has not been implemented")
    }

    @IBOutlet var stationsTableView : UITableView!
    
    @IBAction func returnToDashboard(segue: UIStoryboardSegue ){
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        println("IN SEGUE")
        var startViewController: StartScreenController = segue.destinationViewController as StartScreenController
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bikeAPI = BikeAPIController(delegate:self)
        
        var nib = UINib(nibName: "CustomCell", bundle: nil)
        
        stationsTableView.registerNib(nib, forCellReuseIdentifier: kCellIdentifier)
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        self.bikeAPI.getStations()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stations.count
    }
    
func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: CustomCell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier) as CustomCell!
//        if cell == nil {
            cell = CustomCell(style: UITableViewCellStyle.Value1, reuseIdentifier: kCellIdentifier)
//        }
        
        let station = self.stations[indexPath.row]
        
        println(station)

        cell.loadItem(name: station.name!, city: station.city!,bikes:station.availableDocks!, docks:station.availableBikes!,distance: station.distance!)
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
         println("You selected cell #\(indexPath.row)!")
    }

    func didReceiveAPIResults(results: [NSDictionary]) {
        // Store the results in our table data array
        if results.count>0 {
//            let allResults: NSDictionary[] = results["stationBeanList"] as NSDictionary[]
            let allResults: [NSDictionary] = results as [NSDictionary]
            for result: NSDictionary in allResults {
                var name: String? = result["stationName"] as? String
                var docks: Int? = result["availableDocks"] as? Int
                var longitude: Double? = result["longitude"] as? Double
                var latitude: Double? = result["latitude"] as? Double
                var bikes: Int? = result["availableBikes"] as? Int
                var city: String? = result["city"] as? String
                var distance: Double? = result["distance"] as? Double
                
                var newStation = BikeStation(name: name!,city: city!, availableDocks: docks!, latitude: latitude!, longitude: longitude!, availableBikes: bikes!,distance: distance!)
                stations.append(newStation)
            }
            
//            stations = sort(stations){$0.distance<$1.distance}
            self.stationsTableView.reloadData()
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        }
    }
    
    
    //Calculate distance from a station to currentlocation
    func getDistance(lat: Double, long: Double) -> Double{
        let pi = 3.14159
        let radius = 3958.75587

        let rlat = lat * pi/180
        let rlng = long * pi/180
        let rlat2 = appDelegate.currentLocation.coordinate.latitude * pi/180
        let rlng2 = appDelegate.currentLocation.coordinate.longitude * pi/180
        
        if (rlat == rlat2 && rlng == rlng2){
          return 0
        }
        else{
            //Spherical Law of Cosines
            return radius*acos(sin(rlat)*sin(rlat2)+cos(rlng-rlng2)*cos(rlat)*cos(rlat2))
        }
    }
    
}

