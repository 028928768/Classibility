//
//  NewClassViewController.swift
//  Classibility
//
//  Created by Kanta'MacPro on 4/11/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import UIKit

class NewClassViewController: UIViewController {
    //MARK: Properties
    var new_class: Class?
    let panelImage = UIImage(named: "PanelMaterial")
    
    //MARK: Outlets
    
    @IBOutlet weak var Panel: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Panel.image = panelImage
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
