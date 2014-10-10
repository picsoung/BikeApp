//
//  StartScreenController.swift
//  BikeApp
//
//  Created by Nicolas Grenie on 6/11/14.
//  Copyright (c) 2014 Nicolas Grenie. All rights reserved.
//

import UIKit
import CoreLocation


class StartScreenController: UIViewController {
    @IBOutlet var getLocationButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        let appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        appDelegate.getLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    @IBAction func getLocation(sender : AnyObject){
        println("CLICKED")
        let appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        println(appDelegate.currentLocation.coordinate.longitude)
        println(appDelegate.currentLocation.coordinate.latitude)
    }
    

}
