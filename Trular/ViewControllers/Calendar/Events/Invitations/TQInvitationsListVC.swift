//
//  TQInvitationsListVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 17/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQInvitationsListVC: TQBasePagerVC{

    override func viewDidLoad() {
        self.barHeight = 0.5
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.pagerShouldScroll = true
        // Do any additional setup after loading the view.
        
        self.showSidePanel = false
        self.hideNavigationBar = false
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackGray"), barTintColor: .white, itemTintColor: .lightGray,isBarTranslucent: false)
        
        self.setNavigationTitle(title: "Calendar", titleColor: .colorWithHexString("#404041"), subtitle: "Company"+bulletUnicode+"Stockholm", subtitleColor: .lightGray)
        
        self.setNotificationBtn(notificationCount: 0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController]  {
        
        let receivedInvites = quotesStoryboard.instantiateViewController(withIdentifier: String(describing: TQReceivedInvitationsVC.self)) as! TQReceivedInvitationsVC
        
        let sentInvites = quotesStoryboard.instantiateViewController(withIdentifier: String(describing: TQSentInvitationsVC.self)) as! TQSentInvitationsVC
        
        return [receivedInvites,sentInvites]
    }
}
