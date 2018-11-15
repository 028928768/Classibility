//
//  ProfileViewController.swift
//  Classibility
//
//  Created by Kanta'MacPro on 10/11/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import UIKit
import os.log


class ProfileViewController: UIViewController {
    //MARK: Properties
    var profile : Profile?
    var editedProfile : Profile?
    @IBOutlet weak var profileLogo: UIImageView!
    @IBOutlet weak var profileBackGround: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var surName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var facultyDetail: UILabel!
    @IBOutlet weak var campusDetail: UILabel!
    @IBOutlet weak var genderDetail: UILabel!
    @IBOutlet weak var aboutMeText: UITextView!
    
    //Graphic
    let profileLogoImage = UIImage(named: "profileLogo")
    let profileBackgroundImage = UIImage(named: "profileBackGroundIMG")
    let profileDefaultImage = UIImage(named: "profileIMG")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        assignGraphic()
        storeDefaultProfile()
        profile = loadProfile()
       
        if profile == loadProfile() {
            displayProfile()
        } else {
         //   displayEdittedProfile()
        }
        //displayProfile()
    
        
    }
    func assignGraphic() {
        profileLogo.image = profileLogoImage
        profileBackGround.image = profileBackgroundImage
        profileImage.image = profileDefaultImage
    }
    
    func storeDefaultProfile() {
        self.profile = Profile(surname: "Kanta", lastname:"LastName", campus:"Campus", faculty: "Faculty", gender: "Gender", aboutme: "About Me....")
        saveProfile()
    }
    
    func displayProfile() {
        surName.text = self.profile?.surname
        lastName.text = self.profile?.lastname
        facultyDetail.text = self.profile?.faculty
        campusDetail.text = self.profile?.campus
        genderDetail.text = self.profile?.gender
        aboutMeText.text = self.profile?.aboutme
    }
    func displayEdittedProfile(){
        surName.text = self.editedProfile?.surname
        lastName.text = self.editedProfile?.lastname
        facultyDetail.text = self.editedProfile?.faculty
        campusDetail.text = self.editedProfile?.campus
        genderDetail.text = self.editedProfile?.gender
        aboutMeText.text = self.editedProfile?.aboutme
    }

    
    @IBAction func editProfileMethod(_ sender: Any) {
        self.performSegue(withIdentifier: "ToEditProfile", sender: self)
    }
    
    //Save Profile to database
    private func saveProfile(){
        let isSuccesfulSave = NSKeyedArchiver.archiveRootObject(profile, toFile: Profile.ArchiveURL.path)
        if isSuccesfulSave {
            os_log("Profile saved!")
        } else {
            os_log("Failed to save profile")
        }
    }
    
    //load Profile
    private func loadProfile() -> Profile?{
        return NSKeyedUnarchiver.unarchiveObject(withFile: Profile.ArchiveURL.path) as? Profile
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "ToEditProfile" {
            if let nav = segue.destination as? UINavigationController,
                let vc = nav.topViewController as? EditProfileViewController {
                vc.currentProfile = self.profile
            }
    
           // let secondVC: EditProfileViewController = segue.destination as! EditProfileViewController
        
        }
        
    }
    
    //UnwindBackfrom Edit to Profile Page
    //unwind segue
    @IBAction func unwindToProfile(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? EditProfileViewController, let Editprofile = sourceViewController.editProfile {
            profile = Editprofile
            displayProfile()
        }
    }

}



