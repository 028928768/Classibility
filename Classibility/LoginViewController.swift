//
//  LoginViewController.swift
//  Classibility
//
//  Created by Kanta'MacPro on 24/10/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import UIKit

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
