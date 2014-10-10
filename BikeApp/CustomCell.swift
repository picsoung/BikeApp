//
//  CustomCell.swift
//  BikeApp
//
//  Created by Nicolas Grenie on 6/11/14.
//  Copyright (c) 2014 Nicolas Grenie. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var stationLabel: UILabel!
    @IBOutlet weak var availableBikesLabel: UILabel!
    @IBOutlet weak var availableDocksLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
//    @IBOutlet weak var stationLabel : UILabel!
//    @IBOutlet weak var cityLabel : UILabel?
//    @IBOutlet weak var availableBikesLabel : UILabel?
//    @IBOutlet weak var availableDocksLabel : UILabel?
//    @IBOutlet weak var distanceLabel : UILabel?
    
    func loadItem(name: String, city: String, bikes:Int, docks:Int, distance: Double) {
        println(name)
        println(city)
        println(bikes)
        println(docks)
        println(distance)
        stationLabel.text = name
        println(stationLabel)
        cityLabel?.text = city
        availableBikesLabel?.text = String(bikes)
        availableDocksLabel?.text = String(docks)
        var nf: NSNumberFormatter = NSNumberFormatter()
        nf.maximumFractionDigits = 2;
        distanceLabel?.text = nf.stringFromNumber(distance)+" km"
    }
//    @IBOutlet var stationLabel : UILabel
//    
//    @IBOutlet var cityLabel : UILabel
//    @IBOutlet var availableBikesLabel : UILabel
//    @IBOutlet var availableDocksLabel : UILabel
}
