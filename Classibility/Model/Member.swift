//
//  Member.swift
//  Classibility
//
//  Created by Kanta'MacPro on 4/12/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import Foundation
import UIKit

class Member {
    //MARK: Properties
    var student: String
    init? (student:String){
        if student.isEmpty {
            return nil
        }
        self.student = student
    }
}
