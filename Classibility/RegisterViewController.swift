//
//  RegisterViewController.swift
//  Classibility
//
//  Created by Kanta'MacPro on 25/10/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    let registerPanelImage = UIImage(named: "RegisterPanel")
    //MARK Outlets
    @IBOutlet weak var registerPanel: UIImageView!
    //MARK Authentications
    
    @IBOutlet weak var registerEmailText: UITextField!
    @IBOutlet weak var registerPasswordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        assignRegisterPanel()
       
    }
    
    //MARK Actions
    func assignbackground(){
        let background = UIImage(named: "RegisterBackGround")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    func assignRegisterPanel(){
        let registerPanelImage = UIImage(named: "RegisterPanel")
        registerPanel.image = registerPanelImage
        
    }
    
    @IBAction func signupMethod(_ sender: Any) {
            Auth.auth().createUser(withEmail: registerEmailText.text!, password: registerPasswordText.text!){ (user, error) in
                if error == nil {
                    self.performSegue(withIdentifier: "signInSuccess", sender: self)
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
