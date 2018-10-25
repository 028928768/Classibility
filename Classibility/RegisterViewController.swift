//
//  RegisterViewController.swift
//  Classibility
//
//  Created by Kanta'MacPro on 25/10/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    let registerPanelImage = UIImage(named: "RegisterPanel")
    //MARK Outlets
    @IBOutlet weak var registerPanel: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        assignRegisterPanel()
       
    }
    
    //MARK Actions
    func assignbackground(){
        let background = UIImage(named: "RegisterBackGround")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    func assignRegisterPanel(){
        let registerPanelImage = UIImage(named: "RegisterPanel")
        registerPanel.image = registerPanelImage
        
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
