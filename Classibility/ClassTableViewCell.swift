//
//  ClassTableViewCell.swift
//  Classibility
//
//  Created by Kanta'MacPro on 3/11/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import UIKit

class ClassTableViewCell: UITableViewCell {
    //MARK: Properties
    @IBOutlet weak var subjectCode: UILabel!
    @IBOutlet weak var className: UILabel!
    
    //stack1
    @IBOutlet weak var locationImage: UIImageView!
    @IBOutlet weak var roomLabel: UILabel!
    @IBOutlet weak var facultyLabel: UILabel!
    @IBOutlet weak var campusLabel: UILabel!
    
    //stack2
    @IBOutlet weak var timeImage: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
