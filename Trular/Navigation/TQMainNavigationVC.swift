//
//  TQMainNavigationVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 31/05/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQMainNavigationVC: UINavigationController {

    static let sharedInstance = TQMainNavigationVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        TQNavigationHelper.sharedInstance.navigationController = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
