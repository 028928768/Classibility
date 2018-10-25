//
//  ForgetViewController.swift
//  Classibility
//
//  Created by Kanta'MacPro on 25/10/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import UIKit
import Firebase

class ForgetViewController: UIViewController {
    //MARK Images
    let forgetImage = UIImage(named: "ForgetIMG")
    //MARK Outlets
    @IBOutlet weak var forgetPanelOutlet: UIImageView!
    @IBOutlet weak var ForgetEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignForgetPanel()
        // Do any additional setup after loading the view.
    }
    func assignForgetPanel(){
        forgetPanelOutlet.image = forgetImage
    }

    @IBAction func resendMethod(_ sender: Any) {
        Auth.auth().sendPasswordReset(withEmail: ForgetEmail.text!) { (error) in
            if error == nil{
                self.performSegue(withIdentifier: "forgetToResend", sender: self)
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
