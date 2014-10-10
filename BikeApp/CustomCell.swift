//
//  CustomCell.swift
//  BikeApp
//
//  Created by Nicolas Grenie on 6/11/14.
//  Copyright (c) 2014 Nicolas Grenie. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet var stationLabel : UILabel!
    @IBOutlet var cityLabel : UILabel!
    @IBOutlet var availableBikesLabel : UILabel!
    @IBOutlet var availableDocksLabel : UILabel!
    @IBOutlet var distanceLabel : UILabel!
    
    func loadItem(#name: String, city: String, bikes:Int, docks:Int, distance: Double) {
        stationLabel.text = name
        cityLabel.text = city
        availableBikesLabel.text = String(bikes)
        availableDocksLabel.text = String(docks)
        var nf: NSNumberFormatter = NSNumberFormatter()
        nf.maximumFractionDigits = 2;
        distanceLabel.text = nf.stringFromNumber(distance)+" km"
    }
//    @IBOutlet var stationLabel : UILabel
//    
//    @IBOutlet var cityLabel : UILabel
//    @IBOutlet var availableBikesLabel : UILabel
//    @IBOutlet var availableDocksLabel : UILabel
}
