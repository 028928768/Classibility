//
//  EditProfileViewController.swift
//  Classibility
//
//  Created by Kanta'MacPro on 10/11/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {
    //MARK: Properties
    var profile = [Profile]()
    @IBOutlet weak var editLogo: UIImageView!
    @IBOutlet weak var surName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var campus: UITextField!
    @IBOutlet weak var faculty: UITextField!
    @IBOutlet weak var gender: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    //Actions:
    
    @IBAction func saveMethod(_ sender: Any) {
        //additional save method
        
        
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
