//
//  Lecture.swift
//  Classibility
//
//  Created by Kanta'MacPro on 10/11/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import UIKit
import Foundation
import Firebase

//MARK: Properties
class Lecture {
    
    var week: String
    var date: String
    var room: String
    var arrow: UIImage?
    
    //Initialization
    init (week: String,date: String,room: String,arrow: UIImage?) {
        self.week = week
        self.date = date
        self.room = room
        self.arrow = arrow
       
    }
}
