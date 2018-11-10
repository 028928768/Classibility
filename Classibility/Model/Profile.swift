//
//  Profile.swift
//  Classibility
//
//  Created by Kanta'MacPro on 10/11/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import Foundation
import UIKit

class Profile {
    //MARK: Properties
    
    var surname : String
    var lastname: String
    var campus : String
    var faculty : String
    var gender : String
    var aboutme : String
    
    // Initializer
    init?(surname: String,lastname: String,campus: String,faculty: String,gender: String,aboutme: String){
        //initialize properties to self
        if surname.isEmpty || lastname.isEmpty {
            return nil
        }
        self.surname = surname
        self.lastname = lastname
        self.campus = campus
        self.faculty = faculty
        self.gender = gender
        self.aboutme = aboutme
        
    }
}
