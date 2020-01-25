//
//  PlaceObject.swift
//  Travel
//
//  Created by Chong Ck on 25/01/2020.
//  Copyright © 2020 MAD2. All rights reserved.
//

import Foundation

class PlaceObject{
    var placetype : String
    var checked : Bool
    
    init(placetype : String, checked : Bool) {
        self.placetype = placetype
        self.checked = checked
    }
}
