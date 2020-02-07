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
    @IBOutlet weak var signUpSuccess: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    func ValidEmail(_ email: String) -> Bool {
           let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

           let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
           return emailPred.evaluate(with: email)
       }
       
       func ValidPwd(_ password: String) -> Bool {
           let pwdRegEx = "^(?=.*[a-z])[A-Za-z\\d$@$#!%*?&]{8,}"
           
           let pwdPred = NSPredicate(format: "SELF MATCHES %@",pwdRegEx)
           return pwdPred.evaluate(with: password)
       }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        signUpError.text = ""

        
        //Validations
        if NameTxtFld.text == "" || emailTxtFld.text == "" || passwordTxtFld.text == "" {
            signUpError.text = "Please fill in all input fields."
            return
        }
        else if ValidEmail(emailTxtFld.text!) == false {
            signUpError.text = "Email does not meet requirements."
        }
        else if ValidPwd(passwordTxtFld.text!) == false {
            signUpError.text = "Password does not meet requirements."
        }
        else if ValidEmail(emailTxtFld.text!) && ValidPwd(passwordTxtFld.text!){
            Auth.auth().createUser(withEmail: emailTxtFld.text!, password: passwordTxtFld.text!) { authResult, error in
                     // ...
                if error == nil {
                    if self.signUpSuccess.text == "" {
                        self.signUpSuccess.text = "New user created successfully!"
                    }
                    else {
                        self.signUpSuccess.text = ""
                        sleep(2)
                        self.signUpSuccess.text = "New user created successfully!"
                    }
                }
                else {
                    self.signUpError.text = error?.localizedDescription

                }
            }
       
        }

    }
    
}
