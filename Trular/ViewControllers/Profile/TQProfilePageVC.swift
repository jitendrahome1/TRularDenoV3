//
//  TQProfilePageVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 09/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQProfilePageVC: TQBasePagerVC {

    @IBOutlet var profileImgView: UIImageView!
    @IBOutlet var companyImgVw: UIImageView!
    @IBOutlet var goldMemberBadge: UIImageView!
    
    var type:ProfileType = .user
    
    override func viewDidLoad() {

        // Do any additional setup after loading the view.
        super.viewDidLoad()
        self.setupUI()
    }

    func setupUI() {
        self.profileImgView.layer.cornerRadius = self.profileImgView.frame.width / 2
        self.profileImgView.clipsToBounds = true
        
        if self.type == .user {
            self.companyImgVw.isHidden = false
            self.goldMemberBadge.isHidden = true
            self.profileImgView.image = #imageLiteral(resourceName: "clientDummy2")
        } else {
            self.companyImgVw.isHidden = true
            self.goldMemberBadge.isHidden = false
            self.profileImgView.image = #imageLiteral(resourceName: "companyDummy")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.hideNavigationBar = false
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackWhite"), barTintColor: .clear, itemTintColor: .white,isBarTranslucent: true)
        
        self.setNavigationTitle(title: "Vendors", titleColor: .white, subtitle: "ID: 456454", subtitleColor: .white)
        
        self.extendedLayoutIncludesOpaqueBars = true
        self.edgesForExtendedLayout = .top
        self.showSidePanel = false
        self.barHeight = 0.5
        self.pagerShouldScroll = true
//        UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.lightContent, animated: false)
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController]  {
        
        let info = profilePageStoryboard.instantiateViewController(withIdentifier: String(describing: TQProfileInfoVC.self)) as! TQProfileInfoVC
        
        let statistics = profilePageStoryboard.instantiateViewController(withIdentifier: String(describing: TQProfileStatisticsVC.self)) as! TQProfileStatisticsVC
        
        let messagesVC = profilePageStoryboard.instantiateViewController(withIdentifier: String(describing: TQProfileMessagesVC.self)) as! TQProfileMessagesVC
        
        let quotesVC = profilePageStoryboard.instantiateViewController(withIdentifier: String(describing: TQProfileQuotesVC.self)) as! TQProfileQuotesVC
        
        let inquiriesVC = profilePageStoryboard.instantiateViewController(withIdentifier: String(describing: TQProfileInquiriesVC.self)) as! TQProfileInquiriesVC
        
        return [info,statistics,messagesVC,quotesVC,inquiriesVC]
    }
    
    @IBAction func showCompanyProfileAction(_ sender: UIButton) {
        
        let profileCompanyVC = profilePageStoryboard.instantiateViewController(withIdentifier: String(describing: TQProfilePageVC.self)) as! TQProfilePageVC
        
        profileCompanyVC.type = .company
        
        TQNavigationHelper.sharedInstance.contentMainNavVC.pushViewController(profileCompanyVC, animated: true)
    }
    
}
