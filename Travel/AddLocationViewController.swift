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
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet var labelUser: UIView!
    @IBOutlet weak var txtusername: UITextField!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var txtlocationname: UITextField!
    @IBAction func btnCreateLocation(_ sender: Any) {
        addLocation()
       DisplayAlert()
    }
    
    let locationDelegate = TravelLocationDelegate()
    var latestLocation: CLLocation! = nil

    let locationManager = CLLocationManager()
    
    func addLocation(){
        // get user's current location
        locationManager.delegate = locationDelegate
           
        locationDelegate.locationCallBack = { location in
               self.latestLocation = location

        }
        let latitude = appDelegate.lat
        let longitude = appDelegate.long
       
        refLocations = Database.database().reference().child("Location");

        let location = ["Locationname":txtlocationname.text! as String,"Latitude":latitude as Any, "Longitude":longitude as Any]
        print("\(location)")
        
        refLocations.child(txtusername.text!).childByAutoId().setValue(location)
    }
    func DisplayAlert(){
         if(txtusername.text=="" && txtlocationname.text=="" )
               {
                   let alertView = UIAlertController(title: "failed", message: "failed to add location", preferredStyle: UIAlertController.Style.alert)
                           self.present(alertView,animated: true, completion: nil)
                   //set timer to dismiss alertview
                   let when = DispatchTime.now() + 3
                   DispatchQueue.main.asyncAfter(deadline: when){
                       alertView.dismiss(animated: true, completion: nil);
                   }
               }
               else
               {
                   let alertView = UIAlertController(title: "Success", message: "New location added!!!", preferredStyle: UIAlertController.Style.alert)
                           self.present(alertView,animated: true, completion: nil)
                                 
                   let when = DispatchTime.now() + 3
                   DispatchQueue.main.asyncAfter(deadline: when){
                       alertView.dismiss(animated: true, completion: nil);
                   }
               }
    }
    
    override func viewDidLoad() {
                super.viewDidLoad()
        //refLocations = Database.database().reference().child("\(txtusername.text!)");
        let lat = appDelegate.lat
        let long = appDelegate.long
        print("Test get:\(lat)),\(long)")
    }
    
   

}

