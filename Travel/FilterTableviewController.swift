//
//  FilterTableviewController.swift
//  Travel
//
//  Created by Chong Ck on 24/01/2020.
//  Copyright © 2020 MAD2. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class FilterTableViewcontroller : UITableViewController{
    
    var countrysection = [CountryObject]()
    var peoplesection = [PeopleObject]()
    var placesection = [PlaceObject]()
    let appdelegate = UIApplication.shared.delegate as! AppDelegate

    var filterheaders:[String] = ["Country","People","Place Category","Rating","Datetime"]
    
    @IBAction func Filterdone(_ sender: Any) {
        
        let ref = Database.database().reference()
        
        ref.child("Location").observeSingleEvent(of: .value){
            (snapshot) in
            let data = snapshot.value as? [String:Any]
        }
        
        if((appdelegate.countryselected == "") && (appdelegate.peopleselected == "") && (appdelegate.placeselected == "")){
            
            print("empty")
        }
        else{
            print(Database.database().reference().child("Location").queryOrdered(byChild: "People").queryEqual(toValue: appdelegate.peopleselected))
            print(Database.database().reference().child("Location").queryOrdered(byChild: "Category").queryEqual(toValue: appdelegate.placeselected))
            print(Database.database().reference().child("Location").queryOrdered(byChild: "Country").queryEqual(toValue: appdelegate.countryselected))
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadcountries()
        
        loadpeople()
        
        loadplaces()
    }
    
    // return number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    //return number of rows in each section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case 0:
            return countrysection.count
        case 1:
            return peoplesection.count
        case 2:
            return placesection.count
        default:
            return 0
        }
    }
    
    //header
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        return filterheaders[section]
    }
    
    //footer
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return ""
    }
    
    //populate each row with value from countrysection
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath) as? TableViewCell else{
            fatalError("this cannot be dequeueresuable cell")
        }
        
        switch ((indexPath as NSIndexPath).section) {
            
        case 0:
            cell.Label.text = self.countrysection[(indexPath as NSIndexPath).row].name
            
        case 1:
            cell.Label.text = self.peoplesection[(indexPath as NSIndexPath).row].peopletype
            
        case 2:
            cell.Label.text = self.placesection[(indexPath as NSIndexPath).row].placetype
            
        default:
            cell
            
        }
        return cell
    }
    
    //enable checkmark and remove it
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch ((indexPath as NSIndexPath).section){
            
        case 0 :
            countrysection[indexPath.row].checked = true
            if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark{
                tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
            countrysection[indexPath.row].checked = false
                appdelegate.countryselected = ""
            }
            else{
                tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
                appdelegate.countryselected = countrysection[indexPath.row].name

            }
            
        case 1:
            peoplesection[indexPath.row].checked = true
            if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark{
                tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
            peoplesection[indexPath.row].checked = false
                appdelegate.peopleselected = ""

            }
            else{
                tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
                appdelegate.peopleselected = peoplesection[indexPath.row].peopletype

            }
            
        case 2:
            placesection[indexPath.row].checked = true
            if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark{
                tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
            placesection[indexPath.row].checked = false
                appdelegate.placeselected = ""
            }
            else{
                tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
                appdelegate.placeselected = placesection[indexPath.row].placetype

            }
            
        default:
            0
        }
    }
    
    //create country object and store in countrysection list
    private func loadcountries(){
        
        let country1 = CountryObject(name: "Singapore", checked: false)
            
        let country2 = CountryObject(name: "Malaysia", checked: false)
        
        let country3 = CountryObject(name: "Brunei", checked: false)
        
        let country4 = CountryObject(name: "Thailand", checked: false)
        
        countrysection += [country1,country2,country3,country4]
    }
    
    private func loadpeople(){
        let people1 = PeopleObject(peopletype: "Children", checked: false)
        
        let people2 = PeopleObject(peopletype: "Couple", checked: false)
        
        let people3 = PeopleObject(peopletype: "Elders", checked: false)
        
        let people4 = PeopleObject(peopletype: "Family", checked: false)
        
        let people5 = PeopleObject(peopletype: "Teenager", checked: false)
        
        peoplesection += [people1,people2,people3,people4,people5]
    }
    
    private func loadplaces(){
        let place1 = PlaceObject(placetype: "Architecture", checked: false)
        
        let place2 = PlaceObject(placetype: "Landmarks", checked: false)

        let place3 = PlaceObject(placetype: "Cityscape", checked: false)

        let place4 = PlaceObject(placetype: "Drone", checked: false)

        let place5 = PlaceObject(placetype: "Landscape", checked: false)

        let place6 = PlaceObject(placetype: "Lifestyle", checked: false)
        
        placesection += [place1,place2,place3,place4,place5,place6]

    }
    
}
