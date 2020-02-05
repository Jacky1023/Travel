//
//  AddLocationViewController.swift
//  Travel
//
//  Created by Jacky Wong on 5/2/20.
//  Copyright © 2020 MAD2. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import FirebaseDatabase
import MapKit

class AddLocationViewController:UIViewController{
    var refLocations:DatabaseReference!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet var labelUser: UIView!
    @IBOutlet weak var txtusername: UITextField!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var txtlocationname: UITextField!
    @IBAction func btnCreateLocation(_ sender: Any) {
        addLocation()
    }
    
    let locationDelegate = TravelLocationDelegate()
    var latestLocation: CLLocation? = nil
    
    let locationManager = CLLocationManager()
    
    func addLocation(){
        // get user's current location
        locationManager.delegate = locationDelegate
        
        locationDelegate.locationCallBack = { location in
            self.latestLocation = location
          
        }
        refLocations = Database.database().reference().child("\(txtusername.text!)");

        
        let location = ["Locationname":txtlocationname.text! as String,"Latitude":latestLocation?.coordinate.latitude as Any, "Longitude":latestLocation?.coordinate.longitude as Any]
        print("\(latestLocation?.coordinate.latitude as Any)","\(latestLocation?.coordinate.longitude as Any)")

        refLocations.child(txtusername.text!).setValue(location)
        labelMessage.text = "New Location added!!!"
       
    }
    
    override func viewDidLoad() {
                super.viewDidLoad()
        //refLocations = Database.database().reference().child("\(txtusername.text!)");
       
    
    }
    
   

}
