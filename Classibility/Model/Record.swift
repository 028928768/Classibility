//
//  Record.swift
//  Classibility
//
//  Created by Kanta'MacPro on 4/12/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import Foundation
import UIKit

//MARK: Properties
class Record {
    
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

