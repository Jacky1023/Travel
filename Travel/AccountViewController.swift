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
    
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailtv.text = appdelegate.useremail
    }
    @IBAction func signOutBtn(_ sender: UIBarButtonItem) {
        
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "landingPage") as UIViewController
            vc.modalPresentationStyle = .fullScreen // try without fullscreen
            present(vc,animated: true,completion: nil)
            
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }
    
}
