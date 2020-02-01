//
//  CurrencyConverterViewController.swift
//  Travel
//
//  Created by Chong Ck on 31/01/2020.
//  Copyright © 2020 MAD2. All rights reserved.
//

import Foundation
import UIKit

class CurrencyControllerVC : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var mycurrency:[String] = []
    var mycurrency2:[String] = []
    var myvalues : [Double] = []
    var myvalues2 : [Double] = []
    var activecurrency:Double = 0
    var activecurrency2:Double = 0
    var calculaterate:Double = 0
    
    
    @IBOutlet weak var amounttf: UITextField!
    @IBOutlet weak var pickerview1: UIPickerView!
    @IBOutlet weak var pickerview2: UIPickerView!
    @IBOutlet weak var result: UILabel!
    
    @IBAction func convertbtn(_ sender: Any) {
        if(amounttf.text == ""){
            result.text = "Please input amount."
        }
        else{
            result.text = String(Double(amounttf.text!)! * calculaterate)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView.tag == 1){
            return mycurrency.count // determine number of rows in pickerview
        }
        else{
            return mycurrency2.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView.tag == 1){
            return mycurrency[row] //display countryname in ui
        }
        else{
            return mycurrency2[row] //display countryname in ui
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView.tag == 1){
            activecurrency = myvalues[row] //rates of the country selected
        }
        else{
            activecurrency2 = myvalues2[row] //rates of the country selected
        }
        
        calculaterate = activecurrency2/activecurrency
}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://api.exchangeratesapi.io/latest")
        
        let task = URLSession.shared.dataTask(with: url!) { (data,response,error) in
// Creates a task that retrieves the contents of a URL based on the specified URL request object, and calls a handler upon completion.
            
            if (error != nil){
                print("Error occurs")
            }
            else{
                if let content = data{
                    //content is used to store jsondoc, jsondoc is used to store the data retrieve from url.
                    do{
                        let jsondoc = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        if let rates = jsondoc["rates"] as? NSDictionary {
                            //dictionary is swift struct whereas nsdictionary is cocoa class
                            //its like array and nsarray
                            
                            for( key , value )in rates{
                                // in rates, key is the country name whereas value is the currency, visit the url to refer
                                self.mycurrency.append((key as? String)!)
                                self.myvalues.append((value as? Double)!)
                                self.mycurrency2.append((key as? String)!)
                                self.myvalues2.append((value as? Double)!)
                            }
                        }
                    }
                    catch{
                        
                    }
                }
            }
            self.pickerview1.reloadAllComponents()
            self.pickerview2.reloadAllComponents()
        }
        task.resume() //restart the task if it is suspended/delayed
    }
    
}
