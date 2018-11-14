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
    @IBOutlet weak var camera: UIImageView!
    let tipbarImage = UIImage(named: "TipbarIMG")
    let cameraZoneImage = UIImage(named: "ScanPanelIMG")
    let cameraImage = UIImage(named: "CameraIMG")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TipBar.image = tipbarImage
        assignGraphic()

       
    }
    
    //Graphic
    func assignGraphic(){
        CemeraZone.image = cameraZoneImage
        camera.image = cameraImage
    }
    
    @IBAction func CameraActivated(_ sender: Any) {
        print("Activated Camera!")
    }
    
    //Actions
    @IBAction func Cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    

}
