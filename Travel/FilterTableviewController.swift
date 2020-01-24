//
//  FilterTableviewController.swift
//  Travel
//
//  Created by Chong Ck on 24/01/2020.
//  Copyright © 2020 MAD2. All rights reserved.
//

import Foundation
import UIKit

class FilterTableViewcontroller : UITableViewController{
    
    var countrysection = [CountryObject]()
    
    var filterheaders:[String] = ["Country","Recommended People","Place Category","Rating","Datetime"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadcountries()
    }
    
    // return number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //return number of rows in each section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countrysection.count
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
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath) as? CountryTableViewCell else{
            fatalError("this cannot be dequeueresuable cell")
        }
        
        let country = countrysection[indexPath.row]
        
        cell.countrylabel.text = country.name
        //cell.CountryFlagImage.image = country.image
        
        return cell
    }
    
    //enable checkmark and remove it
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
        }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
    }
    
    //create country object and store in countrysection list
    private func loadcountries(){
        let photo1 = UIImage(named: "SingaporeFlag")!
        let photo2 = UIImage(named: "MalaysiaFlag")!
        
        //let image1 = UIImageView(image: photo1)
        //let image2 = UIImageView(image: photo2)
        
        let country1 = CountryObject(name: "Singapore", image: photo1)!
            
        let country2 = CountryObject(name: "Malaysia", image: photo2)!
        
        countrysection += [country1,country2]
    }
    
}
