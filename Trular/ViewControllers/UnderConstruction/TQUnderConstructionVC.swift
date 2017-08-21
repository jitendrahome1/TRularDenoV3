//
//  TQUnderConstructionVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 20/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQUnderConstructionVC: TQBaseViewController,IndicatorInfoProvider {

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
        
        // Do any additional setup after loading the view.
        
        self.showSidePanel = true
        self.hideNavigationBar = false
        
        self.setLeftNavigationButtons(leftButtonType: .Menu, backImage: nil, barTintColor: .white, itemTintColor: .colorWithHexString("#404041"),isBarTranslucent: false)
        
        self.setNavigationTitle(title: "", titleColor: .colorWithHexString("#404041"), subtitle: "", subtitleColor: .lightGray)
        
        self.setNotificationBtn(notificationCount: 0)
    }
    
    //MARK:- Tab Pager Delegate
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo.init(title: "FULL QUOTE")
    }
}
