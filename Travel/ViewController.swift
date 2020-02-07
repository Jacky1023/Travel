//
//  ViewController.swift
//  Travel
//
//  Created by MAD2 on 15/1/20.
//  Copyright © 2020 MAD2. All rights reserved.
//

import UIKit
import FirebaseDatabase
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let ref = Database.database().reference()
        ref.child("someid").removeValue()
        /*for update firebase*/
//        let updates = ["someid/Username":"John","-Lz2dCTv6nUm0tTkMzjS":"Chen Kang"]
//        ref.updateChildValues(updates)
    }


}


