//
//  Profile.swift
//  Classibility
//
//  Created by Kanta'MacPro on 10/11/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import Foundation
import UIKit
import os.log

class Profile: NSObject, NSCoding {
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("Profile")
    
    //MARK: Properties
    var surname : String
    var lastname: String
    var campus : String
    var faculty : String
    var gender : String
    var aboutme : String
    
    //MARK: Types
    struct PropertyKey {
        static let surname = "surname"
        static let lastname = "lastname"
        static let campus = "campus"
        static let faculty = "faculty"
        static let gender = "gender"
        static let aboutme = "aboutme"
    }
    
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
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(surname,forKey :PropertyKey.surname)
        aCoder.encode(lastname,forKey :PropertyKey.lastname)
        aCoder.encode(campus,forKey :PropertyKey.campus)
        aCoder.encode(faculty,forKey :PropertyKey.faculty)
        aCoder.encode(gender,forKey :PropertyKey.gender)
        aCoder.encode(aboutme,forKey :PropertyKey.aboutme)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        //The Name is required if we cannot decode a name string, initializer should fail
        guard let surname = aDecoder.decodeObject(forKey: PropertyKey.surname) as? String else {
            os_log("Unable to devode the surname for a profile object",log:OSLog.default, type: .debug)
            return nil
        }
        //decode for lastname
        guard let lastname = aDecoder.decodeObject(forKey: PropertyKey.lastname) as? String else {
            os_log("Unable to devode the lastname for a profile object",log:OSLog.default, type: .debug)
            return nil
        }
        //decode for campus
        guard let campus = aDecoder.decodeObject(forKey: PropertyKey.campus) as? String else {
            os_log("Unable to devode the campus for a profile object",log:OSLog.default, type: .debug)
            return nil
        }
        //decode for faculty
        guard let faculty = aDecoder.decodeObject(forKey: PropertyKey.faculty) as? String else {
            os_log("Unable to devode the faculty for a profile object",log:OSLog.default, type: .debug)
            return nil
        }
        //decode for gender
        guard let gender = aDecoder.decodeObject(forKey: PropertyKey.gender) as? String else {
            os_log("Unable to devode the gender for a profile object",log:OSLog.default, type: .debug)
            return nil
        }
        //decode for aboutme
        guard let aboutme = aDecoder.decodeObject(forKey: PropertyKey.aboutme) as? String else {
            os_log("Unable to devode the aboutme for a profile object",log:OSLog.default, type: .debug)
            return nil
        }
        self.init(surname: surname, lastname: lastname, campus: campus, faculty: faculty, gender: gender, aboutme: aboutme)
    }
}
