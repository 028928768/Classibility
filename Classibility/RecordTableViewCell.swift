//
//  RecordTableViewCell.swift
//  Classibility
//
//  Created by Kanta'MacPro on 4/12/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import UIKit

class RecordTableViewCell: UITableViewCell {
    //MARK: Properties
    @IBOutlet weak var recordName: UILabel!
    @IBOutlet weak var recordDate: UILabel!
    @IBOutlet weak var recordRoom: UILabel!
    @IBOutlet weak var recordVector: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
