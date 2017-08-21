//
//  TQDashboardVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 31/05/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQDashboardVC: TQBasePagerVC {

    @IBOutlet var profileImageVw: UIImageView!
    @IBOutlet var companyUserNameLbl: UILabel!
    @IBOutlet var additionalInfoLabel: UILabel!
    
    override func viewDidLoad() {
        self.barHeight = 0.5
        super.viewDidLoad()
        
        self.profileImageVw.layer.cornerRadius = self.profileImageVw.frame.width / 2
        self.profileImageVw.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.pagerShouldScroll = true
        // Do any additional setup after loading the view.
        
        self.showSidePanel = true
        self.hideNavigationBar = false
        
        self.setLeftNavigationButtons(leftButtonType: .Menu, backImage: nil, barTintColor: .white, itemTintColor: .colorWithHexString("#404041"),isBarTranslucent: false)
        
        self.setNavigationTitle(title: "Dashboard", titleColor: .colorWithHexString("#404041"), subtitle: "Company"+bulletUnicode+"Year", subtitleColor: .lightGray)
        
        self.setNotificationBtn(notificationCount: 8)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController]  {
        let statisticsVC = dashboardStoryboard.instantiateViewController(withIdentifier: String(describing: TQDashboardStatisticsVC.self)) as! TQDashboardStatisticsVC
        
        let newsfeedVC = dashboardStoryboard.instantiateViewController(withIdentifier: String(describing: TQDashboardNewsfeedVC.self)) as! TQDashboardNewsfeedVC
        
        let inquiriesVC = dashboardStoryboard.instantiateViewController(withIdentifier: String(describing: TQDashboardInquiriesVC.self)) as! TQDashboardInquiriesVC
        
        let quotesVC = dashboardStoryboard.instantiateViewController(withIdentifier: String(describing: TQDashboardQuotesVC.self)) as! TQDashboardQuotesVC
        
        let activityStreamVC = dashboardStoryboard.instantiateViewController(withIdentifier: String(describing: TQDashboardActivityStreamVC.self)) as! TQDashboardActivityStreamVC
        
        let messagesVC = dashboardStoryboard.instantiateViewController(withIdentifier: String(describing: TQDashboardMessagesVC.self)) as! TQDashboardMessagesVC

        let invitationsVC = dashboardStoryboard.instantiateViewController(withIdentifier: String(describing: TQDashboardInvitationsVC.self)) as! TQDashboardInvitationsVC
        
        let notesVC = dashboardStoryboard.instantiateViewController(withIdentifier: String(describing: TQDashboardNotesVC.self)) as! TQDashboardNotesVC
        
        return [statisticsVC,newsfeedVC,inquiriesVC,quotesVC,activityStreamVC,messagesVC,invitationsVC,notesVC]
    }
}
