//
//  LogInViewController.swift
//  Travel
//
//  Created by Tan Yong Lun on 7/2/20.
//  Copyright © 2020 MAD2. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var passwordTxtFld: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
        
    override func viewDidLoad() {
        errorLabel.text = ""
        
        if Auth.auth().currentUser != nil {
            
            let storyboard = UIStoryboard(name: "Content", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "home") as UIViewController
            vc.modalPresentationStyle = .fullScreen // try without fullscreen
            present(vc,animated: true,completion: nil)
            
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "landingPage") as UIViewController
            vc.modalPresentationStyle = .fullScreen // try without fullscreen
            present(vc,animated: true,completion: nil)
        }
        
        super.viewDidLoad()
    }
    
    //Login Button
    @IBAction func loginBtn(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: emailTxtFld.text!, password: passwordTxtFld.text!) { [weak self] authResult, error in
          guard self != nil else { return }
            
            //If there are errors
            if error != nil {
                self!.errorLabel.text = error?.localizedDescription
            }
            
            //Check if User is signed in
            if Auth.auth().currentUser != nil {
                
                self!.appdelegate.useremail = self!.emailTxtFld.text!
                let storyboard = UIStoryboard(name: "Content", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "home") as UIViewController
                vc.modalPresentationStyle = .fullScreen // try without fullscreen
                self?.present(vc,animated: true,completion: nil)
                
            } else {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "landingPage") as UIViewController
                vc.modalPresentationStyle = .fullScreen // try without fullscreen
                self?.present(vc,animated: true,completion: nil)
            }
            
        }
    }

}

