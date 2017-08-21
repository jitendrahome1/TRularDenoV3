//
//  TQInviteUsersVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 20/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQInviteUsersVC: TQBasePagerVC {

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
        
        self.hideNavigationBar = false
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackGray"), barTintColor: .white, itemTintColor: .lightGray,isBarTranslucent: false)
        
        self.setNavigationTitle(title: "Calendar", titleColor: .colorWithHexString("#404041"), subtitle: "Create an Event"+bulletUnicode+"Add/Edit invited users", subtitleColor: .lightGray)
        
        self.showSidePanel = false
        self.pagerShouldScroll = true
    }

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController]  {
        
        let contacts = quotesStoryboard.instantiateViewController(withIdentifier: String(describing: TQInviteContactsVC.self)) as! TQInviteContactsVC
        
        let invited = quotesStoryboard.instantiateViewController(withIdentifier: String(describing: TQInvitedUsersVC.self)) as! TQInvitedUsersVC
        
        return [contacts,invited]
    }

}
