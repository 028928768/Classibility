//
//  ForgetViewController.swift
//  Classibility
//
//  Created by Kanta'MacPro on 25/10/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import UIKit

class ForgetViewController: UIViewController {
    //MARK Images
    let forgetImage = UIImage(named: "ForgetIMG")
    //MARK Outlets
    @IBOutlet weak var forgetPanelOutlet: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignForgetPanel()
        // Do any additional setup after loading the view.
    }
    func assignForgetPanel(){
        forgetPanelOutlet.image = forgetImage
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
