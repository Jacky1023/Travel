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
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var Login: UIButton!
    @IBAction func btnSignup(_ sender: Any) {
        if true{
                   
                   let storyboard = UIStoryboard(name: "Content", bundle: nil)
                   let vc = storyboard.instantiateViewController(withIdentifier: "Content") as UIViewController
                   vc.modalPresentationStyle = .fullScreen // try without fullscreen
                   present(vc,animated: true,completion: nil)
               }
    }
    @IBAction func btnLogin(_ sender: Any) {
        if true{
        let storyboard = UIStoryboard(name: "Content", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "home") as UIViewController
        vc.modalPresentationStyle = .fullScreen // try without fullscreen
        present(vc,animated: true,completion: nil)
    }
    }
    
    
    
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


