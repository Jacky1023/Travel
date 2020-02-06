//
//  AccountViewController.swift
//  Travel
//
//  Created by Chong Ck on 06/02/2020.
//  Copyright © 2020 MAD2. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class AccountViewcontroller : UIViewController{
    
    @IBOutlet weak var usernametv: UILabel!
    @IBOutlet weak var emailtv: UILabel!
    @IBOutlet weak var userphoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userphoto.isUserInteractionEnabled = true
        userphoto.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector(("imagetapped"))))
    }
    
    @objc func imagetapped(gesture : UITapGestureRecognizer){
        if let userphoto = gesture.view as? UIImageView{
            performSegue(withIdentifier: "ChangePhotoViewController", sender: "")
        }
    }
    
}
