//
//  DetailsViewController.swift
//  Classibility
//
//  Created by Kanta'MacPro on 4/11/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import UIKit
import os.log

class DetailsViewController: UIViewController {
    //MARK: Properties
    var select_class: Class?
    @IBOutlet weak var classCode: UILabel!
    @IBOutlet weak var className: UILabel!
    @IBOutlet weak var roomLabel: UILabel!
    @IBOutlet weak var facultyLabel: UILabel!
    @IBOutlet weak var campusLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var locationPhoto: UIImageView!
    @IBOutlet weak var timePhoto: UIImageView!
    //Images
    let locationImage = UIImage(named: "LocationIMG")
    let timeImage = UIImage(named: "TimeIMG")
    override func viewDidLoad() {
        super.viewDidLoad()
        locationPhoto.image = locationImage
        timePhoto.image = timeImage
        
        //assign received class to outlets
        classCode.text = select_class?.code
        className.text = select_class?.classname
        roomLabel.text = select_class?.roomnumber
        facultyLabel.text = select_class?.faculty
        campusLabel.text = select_class?.campus
        dayLabel.text = select_class?.day
        timeLabel.text = select_class?.time
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        let LectureVC = segue.destination as! LecturesTableViewController
        LectureVC.checkinClass = "Default_Class"
        switch (segue.identifier ?? "") {
        case "mobileSegue":
            LectureVC.checkinClass = "Mobile_Class"
        case "patternSegue":
            LectureVC.checkinClass = "Pattern_Class"
        case "imageSegue":
            LectureVC.checkinClass = "Image_Class"
        default:
            print("default segue case")
        }
        
    }
    
    @IBAction func CheckinMethod(_ sender: Any) {
        if select_class?.classname == "Mobile Devices"{
            self.performSegue(withIdentifier: "mobileSegue", sender: self)
        } else if select_class?.classname == "Pattern Recognition" {
            self.performSegue(withIdentifier: "patternSegue", sender: self)
        } else if select_class?.classname == "Image Processing" {
            self.performSegue(withIdentifier: "imageSegue", sender: self)
        }
    }
    
    

}
