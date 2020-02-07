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
import FirebaseDatabase

class TravelMapViewController : UIViewController{
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    

    @IBOutlet weak var TravelMap: MKMapView!
    let locationDelegate = TravelLocationDelegate()
    var latestLocation: CLLocation? = nil
    var postLocation = [String]()
    let locationManager: CLLocationManager = {
    $0.requestWhenInUseAuthorization()
    $0.desiredAccuracy = kCLLocationAccuracyBest   
    $0.startUpdatingLocation()
    $0.startUpdatingHeading()
    return $0
    }(CLLocationManager())
    
    let regionRadius: CLLocationDistance = 1000
    
    func centermapOnLocation(location: CLLocation)
    {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        
        TravelMap.setRegion(coordinateRegion,animated:true)
    }
    
    //ANNOTATIONLOCATIONS LIST
    let annotationLocations = [
        /*Singapore*/
        ["title":"Universal Studio, Singapore","latitude":1.254,"longitude":103.8328],
        ["title":"Marina Bay Sands, Singapore","latitude":1.2834,"longitude":103.8608],
        ["title":"Mr Crab Seafood Restaurant, Singapore","latitude":1.3116,"longitude":103.7888],
        ["title":"Yu Can Curry Fish Head, Singapore","latitude":1.33919,"longitude":103.88603],
        ["title":"Sentosa, Singapore","latitude":1.2494,"longitude":103.8303],
        /*Malaysia*/
        ["title":"Twin Tower Kuala Lumpur, Malaysia","latitude":3.1579,"longitude":101.712],
        ["title":"Pulau Langkawi, Malaysia","latitude":6.25,"longitude":99.8],
        ["title":"Jalan Alor Night Food Court, Malaysia","latitude":1.14537,"longitude":101.70832],
        ["title":"Restoran Emma Banana Leaf, Malaysia","latitude":1.5132,"longitude":103.652],
        ["title":"Tung Luk Hin Restaurant Bak Kut Teh, Malaysia","latitude":4.58348,"longitude":101.081007],
        /*Brunei*/
        ["title":"Jerudo Park Playground, Brunei","latitude":4.9348,"longitude":114.8344],
        ["title":"Twelves Roof House, Brunei","latitude":4.8774,"longitude":114.9515],
        ["title":"CHop Jing Chew, Brunei","latitude":4.90646,"longitude":114.92594],
        ["title":"Nasi Katok Buttermilk SDK, Brunei","latitude":4.525513,"longitude":114.715454],
        ["title":"GK Restaurant","latitude":4.9527,"longitude":114.841007],
        /*Thailand*/
        ["title":"Karon Beach","latitude":7.8439,"longitude":98.2936],
        ["title":"Wat Rong Khun","latitude":19.8242,"longitude":99.7632],
        ["title":"The Grand Palace","latitude":13.7503,"longitude":100.49118],
        ["title":"Hat Yai Floating Market","latitude":7.0469,"longitude":100.474],
        ["title":"T&K Seafood Yaoewarat","latitude":13.7401,"longitude":100.5107]

    ]
    // CREATE ANNOTATIONS METHOD FOR LOCATIONS IN ANNOTATIONLOCATIONS LIST
    func createAnnotations(locations:[[String:Any]])
    {
        for location in locations{
            let annotations = MKPointAnnotation()
            annotations.title = location["title"]as? String
            annotations.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! CLLocationDegrees, longitude: location["longitude"] as! CLLocationDegrees)
            
            TravelMap.addAnnotation(annotations)
        }
    }
    
    
    
   
     override func viewDidLoad() {
            super.viewDidLoad()
            locationManager.delegate = locationDelegate
            
            locationDelegate.locationCallBack = { location in
                self.latestLocation = location
                let lat = String(format: "Lat: %3.8f", location.coordinate.latitude)
                let long = String(format: "Long: %3.8f", location.coordinate.longitude)
                self.appDelegate.lat = location.coordinate.latitude
                self.appDelegate.long = location.coordinate.longitude
                //print("Test :\(lat),\(long)")
                
                self.centermapOnLocation(location: location)
                
                self.createAnnotations(locations: self.annotationLocations)
                self.TravelMap.showsUserLocation = true
            
            }
            //set firebase reference
           // self.ref = Database.database().reference()
                       
            //Retrieve the location
//            self.ref?.child("Location").observe(.childAdded, with: {(DataSnapshot)in
//            let post = DataSnapshot.value as? String
//                if let actualPost = post{
//                    self.postLocation.append(actualPost)
//                }
                
//        })
    
    
    }


}
