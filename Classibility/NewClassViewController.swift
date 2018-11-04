//
//  NewClassViewController.swift
//  Classibility
//
//  Created by Kanta'MacPro on 4/11/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import UIKit
import os.log

class NewClassViewController: UIViewController {
    //MARK: Properties
    var new_class: Class?
    let panelImage = UIImage(named: "PanelMaterial")
    var segmentView1: UIView!
    var segmentView2: UIView!
    let locationImage = UIImage(named: "LocationIMG")
    let timeImage = UIImage(named: "TimeIMG")
    //MARK: Outlets
    @IBOutlet weak var SegmentControl: UISegmentedControl!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var Panel: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var ClassName: UITextField!
    @IBOutlet weak var subjectCode: UITextField!
    
    //Location
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Panel.image = panelImage
        segmentView1 = LocationViewController().view
        segmentView2 = TimeViewController().view
        viewContainer.addSubview(segmentView1)
        viewContainer.addSubview(segmentView2)
        
        viewContainer.bringSubviewToFront(segmentView1)
        //Hide Time Component
       
        
    }
    

    
    // MARK: - Navigation
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling",log: OSLog.default,type: .debug)
             return
        }
        
        //cast variable to pass value to new_Class
        let subject_code = subjectCode.text ?? ""
        let class_name = ClassName.text ?? ""
        
        //set NewClass for adding to MainClass page
        new_class = Class(subclassCode: subject_code, className: class_name, locationPhoto: locationImage, room: "testroom", faculty: "testFaculty", campus: "Mahidol", timePhoto: timeImage, day: "openday", time: "12.00AM")
       
    }
 
    //private actions
    @IBAction func SegmentTapped(_ sender: Any) {
        let getIndex = SegmentControl.selectedSegmentIndex
        
        switch getIndex {
        case 0:
            print("Location")
            viewContainer.bringSubviewToFront(segmentView1)
            break
        case 1:
            print("Time")
            viewContainer.bringSubviewToFront(segmentView2)
            break
            
        default:
            break
        }
        
    }
    
  
    
}
