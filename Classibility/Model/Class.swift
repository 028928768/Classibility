//
//  Class.swift
//  Classibility
//
//  Created by Kanta'MacPro on 4/11/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import UIKit
import Foundation
import Firebase

//MARK: Properties
class Class {

var campus: String
var classname: String
var code: String
var day:String
var faculty: String
var roomnumber: String
var time:String
var locationPhoto : UIImage?
var timePhoto: UIImage?


//Initialization
init? (campus: String,classname: String,code: String,day: String,faculty: String,roomnumber: String,time: String,locationPhoto: UIImage?,timePhoto: UIImage?)
 {
    
    if code.isEmpty || classname.isEmpty {
        return nil
    }
    
    self.code = code
    self.classname = classname
    self.faculty = faculty
    self.campus = campus
    self.roomnumber = roomnumber
    self.day = day
    self.time = time
    
    self.locationPhoto = locationPhoto
    self.timePhoto = timePhoto
    }
}







//import UIKit
//import Foundation
//import Firebase
//
////MARK: Properties
//class Class {
//
//    var subclassCode: String
//    var className: String
//    //stack1
//    var locationPhoto : UIImage?
//    var room: String
//    var faculty: String
//    var campus: String
//    //stack2
//    var timePhoto: UIImage?
//    var day:String
//    var time:String
//
//    //Initialization
//    init? (subclassCode: String,className: String,locationPhoto: UIImage?,room: String,faculty: String,campus: String,timePhoto: UIImage?,day: String,time: String) {
//
//        if subclassCode.isEmpty || className.isEmpty {
//            return nil
//        }
//
//        self.subclassCode = subclassCode
//        self.className = className
//
//        self.locationPhoto = locationPhoto
//        self.room = room
//        self.faculty = faculty
//        self.campus = campus
//
//        self.timePhoto = timePhoto
//        self.day = day
//        self.time = time
//    }
//}
