//
//  TravelLocationDelegate.swift
//  Travel
//
//  Created by MAD2 on 20/1/20.
//  Copyright © 2020 MAD2. All rights reserved.
//

import Foundation
import CoreLocation

class TravelLocationDelegate : NSObject, CLLocationManagerDelegate
{
    var locationCallBack: ((CLLocation) ->())? = nil
    
    func locationManager(_ _manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        guard let currentLocation = locations.last else{return}
        locationCallBack?(currentLocation)
        //print("Location delegate")
    }
}
