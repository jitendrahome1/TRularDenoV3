//
//  TQCancelQuoteVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 02/08/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQCancelQuoteVC: TQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackGray"), barTintColor: .white, itemTintColor: .lightGray,isBarTranslucent: false)
        
        self.setNavigationTitle(title: "", titleColor: .colorWithHexString("#404041"), subtitle: "", subtitleColor: .lightGray)
    }

    //MARK:- Button Actions
    
    @IBAction func cancelQuoteAction(_ sender: UIButton) {
        
        self.dismiss(animated: true) { 
            guard let vc = TQNavigationHelper.sharedInstance.getViewControllerFromStack(String(describing:TQNewQuoteOptionVC.self)) else {
                return
            }
            
            TQNavigationHelper.sharedInstance.contentMainNavVC.popToViewController(vc, animated: true)
        }
    }
    
    //MARK:- Header Button Actions
    override func actionBack() {
        self.dismiss(animated: true, completion: nil)
    }
}
