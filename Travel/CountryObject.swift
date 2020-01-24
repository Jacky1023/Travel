//
//  CountryObject.swift
//  Travel
//
//  Created by Chong Ck on 24/01/2020.
//  Copyright © 2020 MAD2. All rights reserved.
//

import Foundation
import UIKit

class CountryObject{
    var name:String
    var image:UIImage!
    
    init!(name:String,image:UIImage!) {
        self.name = name
        self.image=image
    }
}
