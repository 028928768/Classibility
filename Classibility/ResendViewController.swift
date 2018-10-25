//
//  ResendViewController.swift
//  Classibility
//
//  Created by Kanta'MacPro on 25/10/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import UIKit

class ResendViewController: UIViewController {
    //MARK Images
    let rocketImage = UIImage(named: "rocketIMG")
    //MARK Outlets
    @IBOutlet weak var rocketOutlet: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignRocketImage()
        // Do any additional setup after loading the view.
    }
    
    func assignRocketImage(){
        rocketOutlet.image = rocketImage
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
