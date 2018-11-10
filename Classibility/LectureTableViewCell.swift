//
//  LectureTableViewCell.swift
//  Classibility
//
//  Created by Kanta'MacPro on 10/11/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import UIKit

class LectureTableViewCell: UITableViewCell {
    //MARK: Properties
    @IBOutlet weak var lectureOrder: UILabel!
    @IBOutlet weak var lectureDate: UILabel!
    @IBOutlet weak var lectureRoom: UILabel!
    @IBOutlet weak var lectureVector: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
