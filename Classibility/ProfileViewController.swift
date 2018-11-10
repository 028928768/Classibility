//
//  ProfileViewController.swift
//  Classibility
//
//  Created by Kanta'MacPro on 10/11/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    //MARK: Properties
    var profile : Profile?
    @IBOutlet weak var profileLogo: UIImageView!
    @IBOutlet weak var profileBackGround: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var surName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var facultyDetail: UILabel!
    @IBOutlet weak var campusDetail: UILabel!
    @IBOutlet weak var genderDetail: UILabel!
    @IBOutlet weak var aboutMeText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadDefaultProfile()
        displayProfile()
    }
    
    func loadDefaultProfile() {
        
         self.profile = Profile(surname: "Name", lastname: "LastName", campus: "Campus", faculty: "Faculty", gender: "Gender", aboutme: "About Me....")
    }
    func displayProfile() {
        surName.text = self.profile?.surname
        lastName.text = self.profile?.lastname
        facultyDetail.text = self.profile?.faculty
        campusDetail.text = self.profile?.campus
        genderDetail.text = self.profile?.gender
        aboutMeText.text = self.profile?.aboutme
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
