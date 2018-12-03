//
//  ProfileViewController.swift
//  Classibility
//
//  Created by Kanta'MacPro on 10/11/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import UIKit
import os.log
import Alamofire
import SwiftyJSON
import FirebaseAuth

class ProfileViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    //MARK: Properties
    var profile : Profile?
    var editedProfile : Profile?
    //var userID = Auth.auth().currentUser!.uid
    
    var app_id = "d37e1b09"
    var app_key = "720d253758e6e33d6ba3558f6ae61a31"
    
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
    
    func enroll(imageBase64: String){
        var request = URLRequest(url: URL(string: "https://api.kairos.com/enroll")!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.setValue(app_id, forHTTPHeaderField: "app_id")
        request.setValue(app_key, forHTTPHeaderField: "app_key")
        
        let params : NSMutableDictionary? = [
            "image" : imageBase64,
            "gallery_name" : "profileEnroll",
            "subject_id" : "userID2"
        ]
        let data = try! JSONSerialization.data(withJSONObject: params!, options: JSONSerialization.WritingOptions.prettyPrinted)
        
        let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        request.httpBody = json!.data(using: String.Encoding.utf8.rawValue);
        Alamofire.request(request).responseJSON { (response) in
            if((response.result.value) != nil) {
                let json = JSON(response.result.value!)
                
                let alert = UIAlertController(title: "Kairos", message: "\(json)", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
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
    
    //Profile Image Picking Actions
    @IBAction func selectProfileImage(_ sender: UITapGestureRecognizer) {
        //UIImagePickerController is a view controller that let's a user pick media from their photo library
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.delegate = self
        present(imagePickerController,animated: true,completion: nil)
    }
    
    //imagepicker delegate method
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            let imagedata = selectedImage.jpegData(compressionQuality: 1.0)
            let base64String : String = imagedata!.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
            let imageStr : String = base64String.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            
            enroll(imageBase64: imageStr)
            profileImage.image = selectedImage
        }
        else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        //Set photoImageView to display the selected image.
        
        //Dismiss the picker.
        dismiss(animated: true, completion: nil)
        
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



