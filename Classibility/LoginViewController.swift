//
//  LoginViewController.swift
//  Classibility
//
//  Created by Kanta'MacPro on 24/10/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import UIKit
import Firebase
import os.log

class LoginViewController: UIViewController {
    //MARK Outlets
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgetLabel: UILabel!
    @IBOutlet weak var registerLabel: UILabel!
    
    //MARK Authentication
    
    @IBOutlet weak var EmailText: UITextField!
    @IBOutlet weak var PasswordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK Actions
    @IBAction func loginMethod(_ sender: Any) {
        if EmailText.text == nil || PasswordText.text == nil {
            NSLog("null input")
        }
        Auth.auth().signIn(withEmail: EmailText.text!, password: PasswordText.text!) { (user, error) in
            if error == nil{
                self.performSegue(withIdentifier: "loginToHome", sender: self)
            }
            else{
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
    
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
