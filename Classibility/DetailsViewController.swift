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
        classCode.text = select_class?.subclassCode
        className.text = select_class?.className
        roomLabel.text = select_class?.room
        facultyLabel.text = select_class?.faculty
        campusLabel.text = select_class?.campus
        dayLabel.text = select_class?.day
        timeLabel.text = select_class?.time
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    

}
