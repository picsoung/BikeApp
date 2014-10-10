//
//  BikeAPIController.swift
//  BikeApp
//
//  Created by Nicolas Grenie on 6/11/14.
//  Copyright (c) 2014 Nicolas Grenie. All rights reserved.
//

import Foundation

protocol APIControllerProtocol {
    func didReceiveAPIResults(results: NSDictionary)
}

class BikeAPIController{
    var delegate: APIControllerProtocol
    
    init(delegate: APIControllerProtocol) {
        self.delegate = delegate
    }
    
    func getStations() {
        var urlPath = "https://017566ec-4a7ff8560c02.my.apitools.com/"
        urlPath+="stations/json"
        var url: NSURL = NSURL(string: urlPath)
        var request: NSURLRequest = NSURLRequest(URL: url)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
            println("Task completed")
            if(error != nil) {
                // If there is an error in the web request, print it to the console
                println(error.localizedDescription)
    
            var err: NSError?
            
            println(data)
//                var jsonResult: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSDictionary
            if(err != nil) {
                // If there is an error parsing JSON, print it to the console
                println("JSON Error \(err!.localizedDescription)")
            }
//            let results: NSArray = jsonResult[0] as NSArray
//            self.delegate.didReceiveAPIResults(jsonResult)
            }else{
                var err: NSError?
                
                var jsonResult: NSDictionary =  NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error: &err) as NSDictionary
                println("Synchronous\(jsonResult)")
                
                
//                let json = JSON(data: data)
//                println("JJ")
//                println(json)
//                println("\(object_getClassName(json[0].stringValue))");
//                println(json[0]["stationName"].stringValue)
//                if let first = json[0]["stationName"].stringValue{
//                    println("AAAA")
//                }
//                let results: NSDictionary = jsonResult as NSDictionary
                self.delegate.didReceiveAPIResults(jsonResult)
            }
    })
        
        task.resume()
    }
//    func connection(connection: NSURLConnection!, didFailWithError error: NSError!) {
//        println("Connection failed.\(error.localizedDescription)")
//    }
    
    
//    func connection(didReceiveResponse: NSURLConnection!, didReceiveResponse response: NSURLResponse!) {
//        // Recieved a new request, clear out the data object
//        self.data = NSMutableData()
//    }
//    
//    func connection(connection: NSURLConnection!, didReceiveData data: NSData!) {
//        // Append the recieved chunk of data to our data object
//        self.data.appendData(data)
//    }
//    
//    func connectionDidFinishLoading(connection: NSURLConnection!) {
//        // Request complete, self.data should now hold the resulting info
//        // Convert the retrieved data in to an object through JSON deserialization
//        var err: NSError
//        var jsonResult: [NSDictionary] = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as [NSDictionary]
//        
//        println(jsonResult)
//        
//        // Now send the JSON result to our delegate object
//        self.delegate?.didReceiveAPIResults(jsonResult)
//    }
}