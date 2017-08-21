//
//  TQInvitationSentVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 20/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQInvitationSentVC: TQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.hideNavigationBar = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Button Actions
    @IBAction func BackAction(_ sender: UIButton) {
        TQNavigationHelper.sharedInstance.contentMainNavVC.popViewController(animated: true)
    }
}
