//
//  CurrencyConverterViewController.swift
//  Travel
//
//  Created by Chong Ck on 31/01/2020.
//  Copyright © 2020 MAD2. All rights reserved.
//

import Foundation
import UIKit

class CurrencyControllerVC : UIViewController{
    
    var mycurrency:[String] = []
    
    var myvalues : [Double] = []
    
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
                            }
                        }
                    }
                    catch{
                        
                    }
                }
            }
        }
        task.resume() //restart the task if it is suspended/delayed
    }
    
}
