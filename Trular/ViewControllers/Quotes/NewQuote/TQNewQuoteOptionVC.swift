//
//  TQNewQuoteOptionVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 31/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQNewQuoteOptionVC: TQBaseViewController {

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
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackWhite"), barTintColor: .clear, itemTintColor: .white,isBarTranslucent: true)
        
        self.setNavigationTitle(title: "", titleColor: .colorWithHexString("#404041"), subtitle: "", subtitleColor: .lightGray)
    }
    
    //MARK:- Button Actions
    @IBAction func backAction(_ sender: UIButton) {
        
        TQNavigationHelper.sharedInstance.contentMainNavVC.popViewController(animated: true)
    }
    
    @IBAction func privateAction(_ sender: UIButton) {
        
        TQNavigationHelper.sharedInstance.pushViewController(storyboard: quotesStoryboard, viewController: String(describing:TQNewQuoteTypeVC.self))
    }
    
    @IBAction func companyAction(_ sender: UIButton) {
        
        TQNavigationHelper.sharedInstance.pushViewController(storyboard: quotesStoryboard, viewController: String(describing:TQNewQuoteTypeVC.self))
    }
    
}
