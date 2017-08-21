//
//  TQClientRegistrationOptionVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 26/05/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQClientRegistrationOptionVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK:- Button Actions
    
    @IBAction func clientPrivateRegistration(_ sender: UIButton) {
        
        let registration_Client = mainStoryboard.instantiateViewController(withIdentifier: String(describing: TQRegistration_ClientNameVC.self)) as! TQRegistration_ClientNameVC
        TQHelper.sharedInstance.registrationInfoDict?[CLIENT_TYPE] = ClientType.Individual as AnyObject
        TQNavigationHelper.sharedInstance.loginContainerNavigation.pushViewController(registration_Client, animated: true)
    }
    
    @IBAction func clientCompanyRegistration(_ sender: UIButton) {
    
        let registration_Company = mainStoryboard.instantiateViewController(withIdentifier: String(describing: TQRegistration_CompanyNameVC.self)) as! TQRegistration_CompanyNameVC
        TQHelper.sharedInstance.registrationInfoDict?[CLIENT_TYPE] = ClientType.Company as AnyObject
        TQNavigationHelper.sharedInstance.loginContainerNavigation.pushViewController(registration_Company, animated: true)
    }
}
