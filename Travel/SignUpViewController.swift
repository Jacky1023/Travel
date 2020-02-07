//
//  SignUpViewController.swift
//  Travel
//
//  Created by Tan Yong Lun on 7/2/20.
//  Copyright © 2020 MAD2. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {
    
    //TextFields
    @IBOutlet weak var NameTxtFld: UITextField!
    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var passwordTxtFld: UITextField!
    @IBOutlet weak var signUpError: UILabel!
    
    override func viewDidLoad() {
        signUpError.text = ""
        
        super.viewDidLoad()
    }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: emailTxtFld.text!, password: passwordTxtFld.text!) { authResult, error in
          // ...
            
        }
    }
    
}
