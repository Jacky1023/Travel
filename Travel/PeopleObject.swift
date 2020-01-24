//
//  PeopleObject.swift
//  Travel
//
//  Created by Chong Ck on 25/01/2020.
//  Copyright © 2020 MAD2. All rights reserved.
//

import Foundation

class PeopleObject {
    var peopletype : String
    var checked : Bool
    
    init(peopletype : String, checked : Bool) {
        self.peopletype = peopletype
        self.checked = checked
    }
}
