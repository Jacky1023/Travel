//
//  TravelMapViewController.swift
//  Travel
//
//  Created by MAD2 on 20/1/20.
//  Copyright © 2020 MAD2. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import MapKit


class TravelMapViewController : UIViewController{
    @IBOutlet weak var TravelMap: MKMapView!
    let locationDelegate = TravelLocationDelegate()
    var latestLocation: CLLocation? = nil
    let locationManager: CLLocationManager = {
    $0.requestWhenInUseAuthorization()
    $0.desiredAccuracy = kCLLocationAccuracyBest
    $0.startUpdatingLocation()
    $0.startUpdatingHeading()
    return $0
    }(CLLocationManager())
    
    let regionRadius: CLLocationDistance = 250
    
    func centermapOnLocation(location: CLLocation)
    {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        
        TravelMap.setRegion(coordinateRegion,animated:true)
    }
    
     override func viewDidLoad() {
            super.viewDidLoad()
            locationManager.delegate = locationDelegate
            
            locationDelegate.locationCallBack = { location in
                self.latestLocation = location
                let lat = String(format: "Lat: %3.8f", location.coordinate.latitude)
                let long = String(format: "Long: %3.8f", location.coordinate.longitude)
                print("\(lat),\(long)")
                
                self.centermapOnLocation(location: location)
            }
        }
    }


