//
//  HisClass.swift
//  Classibility
//
//  Created by Kanta'MacPro on 4/12/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import Foundation
import UIKit

//MARK:Properties

class HisClass {
    
    var hisClassName: String
    var hisClassDate: String
    var hisClassRoom: String
    var hisClassArrow: UIImage?
    
    init? (hisClassName:String, hisClassDate: String, hisClassRoom: String, hisClassArrow: UIImage?){
        if hisClassName.isEmpty {
            return nil
        }
        self.hisClassName = hisClassName
        self.hisClassDate = hisClassDate
        self.hisClassRoom = hisClassRoom
        self.hisClassArrow = hisClassArrow
    }
}
