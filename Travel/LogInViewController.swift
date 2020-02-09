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
    //ACTIONS
    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var passwordTxtFld: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    //GLOBAL VARIABLES
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    var handle: AuthStateDidChangeListenerHandle?
    let ref = Database.database().reference()
        
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
    //Login Button
    @IBAction func loginBtn(_ sender: UIButton) {
        if handle != nil {
                   Auth.auth().removeStateDidChangeListener(handle!)
               }
         errorLabel.text = ""
        //Validation
        if emailTxtFld.text != "" && passwordTxtFld.text != "" {
            errorLabel.text = "Attempting to log in..."
            self.appdelegate.useremail = self.emailTxtFld.text!
            print(emailTxtFld.text)
            print(passwordTxtFld.text)
            Auth.auth().signIn(withEmail: emailTxtFld.text!, password: passwordTxtFld.text!) { [weak self] authResult, error in
                guard self != nil else { return }
                
                if error != nil {
                    self!.errorLabel.text = error?.localizedDescription
                }
            }
            
            handle = Auth.auth().addStateDidChangeListener { (auth, user) in
                if (user?.uid != nil) {
                    print("UserID: \(user?.uid)")
                    
                    self.appdelegate.userid =  user!.uid
                    
                    
                    let sb = UIStoryboard(name: "Content", bundle: nil)
                    let vc = sb.instantiateViewController(identifier: "home") as UIViewController
                     
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
                    
                }
            }
        }
        else {
            errorLabel.text = "Please input both fields"
        }
    }

}

