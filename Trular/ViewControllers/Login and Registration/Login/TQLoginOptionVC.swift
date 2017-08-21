//
//  TQClientLoginOptionVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 29/05/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQLoginOptionVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clientLoginAction(_ sender: UIButton) {
        
        let login_clientVC = mainStoryboard.instantiateViewController(withIdentifier: String(describing: TQLogin_ClientVC.self)) as! TQLogin_ClientVC
        TQHelper.sharedInstance.loginInfoDict?[CLIENT_TYPE] = ClientType.Individual as AnyObject
        TQNavigationHelper.sharedInstance.loginContainerNavigation.pushViewController(login_clientVC, animated: true)
    }
    
    @IBAction func companyLoginAction(_ sender: UIButton) {
        
        let login_companyVC = mainStoryboard.instantiateViewController(withIdentifier: String(describing: TQLogin_CompanyVC.self)) as! TQLogin_CompanyVC
        TQHelper.sharedInstance.loginInfoDict?[CLIENT_TYPE] = ClientType.Company as AnyObject
        TQNavigationHelper.sharedInstance.loginContainerNavigation.pushViewController(login_companyVC, animated: true)
    }
}
