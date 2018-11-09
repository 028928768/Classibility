//
//  CheckInViewController.swift
//  Classibility
//
//  Created by Kanta'MacPro on 10/11/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import UIKit

class CheckInViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var TipBar: UIImageView!
    @IBOutlet weak var CemeraZone: UIImageView!
    let tipbarImage = UIImage(named: "TipbarIMG")
    override func viewDidLoad() {
        super.viewDidLoad()
        TipBar.image = tipbarImage

       
    }
    
    @IBAction func CameraActivated(_ sender: Any) {
        print("Activated Camera!")
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
