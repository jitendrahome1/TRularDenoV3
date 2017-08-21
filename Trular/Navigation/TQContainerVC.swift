//
//  TQContainerVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 21/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQContainerVC: TQBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
       
        self.navigationController?.isNavigationBarHidden = true
        
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "contentNavigation" {
            TQNavigationHelper.sharedInstance.contentMainNavVC = segue.destination as! UINavigationController as! TQContentNavigationVC
            
            TQNavigationHelper.sharedInstance.navigationController.isNavigationBarHidden  = true
            TQNavigationHelper.sharedInstance.mainContainerMainVC  = self
            let dashboardVC = dashboardStoryboard.instantiateViewController(withIdentifier: String(describing: TQDashboardVC.self)) as! TQDashboardVC
            TQNavigationHelper.sharedInstance.contentMainNavVC?.setViewControllers([dashboardVC], animated: true)
        }
    }
}


