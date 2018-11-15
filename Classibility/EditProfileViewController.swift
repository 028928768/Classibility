//
//  EditProfileViewController.swift
//  Classibility
//
//  Created by Kanta'MacPro on 10/11/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import UIKit
import os.log


class EditProfileViewController: UIViewController {
    //MARK: Properties
    var currentProfile :Profile?
    var editProfile : Profile?
    @IBOutlet weak var editLogo: UIImageView!
    @IBOutlet weak var editProfilePanel: UIImageView!
    @IBOutlet weak var surName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var campus: UITextField!
    @IBOutlet weak var faculty: UITextField!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var aboutme: UITextView!
    
    @IBOutlet weak var saveButton: UIButton!
    
    
    //MARK: Graphic
    let editProfilePanelImage = UIImage(named: "editProfileIMG")
    let editProfileLogoImage = UIImage(named: "editProfileLogoIMG")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        assignGraphic()
        //storeDefaultProfile()
        //currentProfile = loadProfile()
        displayCurrentProfile()
        
    }
    
    func assignGraphic(){
        editLogo.image = editProfileLogoImage
        editProfilePanel.image = editProfilePanelImage
    }
    

    
    //Actions:
    func storeDefaultProfile() {
        self.editProfile = Profile(surname: "Name", lastname:"LastName", campus:"Campus", faculty: "Faculty", gender: "Gender", aboutme: "About Me....")
        saveProfile()
    }

    func displayCurrentProfile() {
        surName.text = currentProfile?.surname
        lastName.text = currentProfile?.lastname
        campus.text = currentProfile?.campus
        faculty.text = currentProfile?.faculty
        gender.text = currentProfile?.gender
        aboutme.text = currentProfile?.aboutme
        
       // editProfile = Profile(surname: surName.text ?? "Name", lastname: lastName.text ?? "LastName", campus: campus.text ?? "", faculty: faculty.text ?? "", gender: gender.text ?? " ", aboutme: aboutme.text)
    }
    
    @IBAction func saveMethod(_ sender: Any) {
        //additional save method
        editProfile = Profile(surname: surName.text ?? "Name", lastname: lastName.text ?? "LastName", campus: campus.text ?? "", faculty: faculty.text ?? "", gender: gender.text ?? " ", aboutme: aboutme.text)
        saveProfile()
        
        
         self.performSegue(withIdentifier: "saveProfile", sender: self)
        self.dismiss(animated: false, completion: nil)
        
    }
    //save Profile
    private func saveProfile(){
        let isSuccesfulSave = NSKeyedArchiver.archiveRootObject(editProfile, toFile: Profile.ArchiveURL.path)
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
    
    
    @IBAction func Cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
       
        guard let button = sender as? UIButton, button === saveButton else {
            os_log("The save button was not pressed, cancelling",log: OSLog.default, type: .debug)
            return
        }
        print("InsertData")
        //store data to unwindSegue
        let editsurName = surName.text
        let editlastName = lastName.text
        let editCampus = campus.text
        let editFaculty = faculty.text
        let editgender = gender.text
        let editAboutme = aboutme.text
        editProfile = Profile(surname: editsurName ?? "Name", lastname: editlastName ?? "LastName", campus: editCampus ?? "Campus", faculty: editFaculty ?? "Faculty", gender: editgender ?? "Gender", aboutme: editAboutme ?? "About me ....")
        
        
    }
    
    
    
    
    
}







