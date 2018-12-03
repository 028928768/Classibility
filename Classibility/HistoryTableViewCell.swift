//
//  HistoryTableViewCell.swift
//  Classibility
//
//  Created by Kanta'MacPro on 4/12/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    //MARK: Properties
    
    @IBOutlet weak var hisClassName: UILabel!
    @IBOutlet weak var hisClassDate: UILabel!
    @IBOutlet weak var hisClassRoom: UILabel!
    @IBOutlet weak var hisClassArrow: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
