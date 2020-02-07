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

class AddLocationViewController:UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    //GLOBAL VARIABLES
    var countryList:[String] = ["Singapore","Malaysia","Brunei","Indonesia","Vietnam"]
    var peopleList:[String] = ["Children","Couple","Elders","Family","Teenager"]
    var categoryList:[String] = ["Architecture","Landmarks","Cityscape","Drone","Landscape","Lifestyle"]
    var selectedCountry:String = ""
    var selectedPeople:String = ""
    var selectedCategory:String = ""

    var refLocations:DatabaseReference!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    //OUTLET
    @IBOutlet var labelUser: UIView!
    @IBOutlet weak var txtusername: UITextField!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var txtlocationname: UITextField!
    @IBOutlet weak var Countrypicker: UIPickerView!
    @IBOutlet weak var Peoplepicker: UIPickerView!
    @IBOutlet weak var datelabel: UILabel!
    @IBOutlet weak var Categorypicker: UIPickerView!
    //BUTTON
    @IBAction func btnCreateLocation(_ sender: Any) {
        addLocation()
       DisplayAlert()
    }
    
   
    let locationDelegate = TravelLocationDelegate()
    var latestLocation: CLLocation! = nil
    let locationManager = CLLocationManager()
    //ADD LOCATION METHOD
    func addLocation(){
        // get user's current location
        locationManager.delegate = locationDelegate
           
        locationDelegate.locationCallBack = { location in
               self.latestLocation = location

        }
        //GET USER'S CURRENT LOCATION WHICH IS LONGITUDE AND LATITUDE
        let latitude = appDelegate.lat
        let longitude = appDelegate.long
       //A KEY TO THAT TO PUSH ALL THE DATA UNDER LOCATION KEY
        refLocations = Database.database().reference().child("Location");
        self.appDelegate.username = self.txtusername.text!
        let location = ["Locationname":txtlocationname.text! as String,"Latitude":latitude as Any, "Longitude":longitude as Any,"Country":selectedCountry,"People":selectedPeople,"Category":selectedCategory,"DateTime":datelabel.text!]
        //A USER CAN HAVE MANY LOCATION DATA, SO THAT EVERY DATA NEED TO HAVE UNIQUE ID FOR IT.
        refLocations.child(txtusername.text!).childByAutoId().setValue(location)
    }
    //ALERT VIEW TO REMIND USER
    func DisplayAlert(){
         if(txtusername.text=="" && txtlocationname.text=="" )
               {
                   let alertView = UIAlertController(title: "failed", message: "failed to add location", preferredStyle: UIAlertController.Style.alert)
                           self.present(alertView,animated: true, completion: nil)
                alertView.addAction(UIAlertAction(title: "Dismiss", style: .default))
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
                alertView.addAction(UIAlertAction(title: "Dismiss", style: .default))
                            
                   let when = DispatchTime.now() + 3
                   DispatchQueue.main.asyncAfter(deadline: when){
                       alertView.dismiss(animated: true, completion: nil);
                   }
               }
    }
    
    override func viewDidLoad() {
                super.viewDidLoad()
        
        self.Countrypicker.delegate = self
        self.Countrypicker.dataSource = self
        self.Peoplepicker.delegate = self
        self.Peoplepicker.dataSource = self
        self.Categorypicker.delegate = self
        self.Categorypicker.dataSource = self
        
        //Today Date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm a"
        let dateString = dateFormatter.string(from:Date())
        let todayDate = dateFormatter.date(from: dateString)
        datelabel.text = dateString
            
    }
    /*Picker View Method*/
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == Countrypicker{
            return countryList.count
        }
        else if pickerView == Peoplepicker{
            return peopleList.count
        }
        else{
            return categoryList.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == Countrypicker{
            return countryList[row]
        }
        else if pickerView == Peoplepicker{
            return peopleList[row]
        }
        else{
            return categoryList[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == Countrypicker{
            selectedCountry = countryList[row]
        }
        else if pickerView == Peoplepicker{
            selectedPeople = peopleList[row]
        }
        else{
            selectedCategory = categoryList[row]
        }
    }

   

}


