//
//  TQFeedbackVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 28/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQFeedbackVC: TQBasePagerVC {

    override func viewDidLoad() {
        self.barHeight = 0.5

        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.pagerShouldScroll = true
        // Do any additional setup after loading the view.
        
        self.showSidePanel = true
        self.hideNavigationBar = false
        
        self.setLeftNavigationButtons(leftButtonType: .Menu, backImage: nil, barTintColor: .white, itemTintColor: .colorWithHexString("#404041"),isBarTranslucent: false)
        
        self.setNavigationTitle(title: "Feedback", titleColor: .colorWithHexString("#404041"), subtitle: "Spotify Inc"+bulletUnicode+"Company", subtitleColor: .lightGray)
        
        self.setNotificationBtn(notificationCount: 0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController]  {
        
        let received = otherStoryboard.instantiateViewController(withIdentifier: String(describing: TQFeedbackReceivedVC.self)) as! TQFeedbackReceivedVC
        
        let sent = otherStoryboard.instantiateViewController(withIdentifier: String(describing: TQFeedbackSentVC.self)) as! TQFeedbackSentVC
        
        let pending = otherStoryboard.instantiateViewController(withIdentifier: String(describing: TQFeedbackPendingVC.self)) as! TQFeedbackPendingVC
        
        return [received,sent,pending]
    }    
}
