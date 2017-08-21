//
//  TQRegistrationFailureVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 29/05/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQRegistrationFailureVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Button Actions
    @IBAction func login(_ sender: Any) {
        
        let containerVC = mainStoryboard.instantiateViewController(withIdentifier: String(describing: TQSignUpContainerVC.self)) as! TQSignUpContainerVC
        containerVC.didPressLogin = true
        TQNavigationHelper.sharedInstance.navigationController.pushViewController(containerVC, animated: true)
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        
        TQNavigationHelper.sharedInstance.navigationController.popViewController(animated: true)
    }
}
