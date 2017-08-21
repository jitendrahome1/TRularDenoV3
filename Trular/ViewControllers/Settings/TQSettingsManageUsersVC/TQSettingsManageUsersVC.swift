//
//  TQSettingsClientCompanyAccManageUsersVC.swift
//  Trular
//
//  Created by Indusnet on 12/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQSettingsManageUsersVC: TQBasePagerVC {
    
  
    override func viewDidLoad() {
        
        self.hideNavigationBar=false
        self.pagerShouldScroll = true

             super.viewDidLoad()

       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackGray"), barTintColor: .white, itemTintColor: .lightGray,isBarTranslucent: false)
        
        self.setNavigationTitle(title: "Settings", titleColor: .colorWithHexString("#404041"), subtitle:   "Company Account"+bulletUnicode+"Manage users", subtitleColor: .colorWithHexString("#404041"))
        
        if TQHelper.sharedInstance.currentUserType == .VendorAdmin || TQHelper.sharedInstance.currentUserType == .ClientAdmin {
            
            self.setRightBarButtonText(text: "Admin", textColor: .colorWithHexString("#666666"), backgroundColor: .colorWithHexString("#f2f3f5"), showBorder: false, borderColor: .colorWithHexString("#f2f3f5"))
        }
    
        
//        self.extendedLayoutIncludesOpaqueBars = true
//        self.edgesForExtendedLayout = .top
        self.hideNavigationBar = false
        self.showSidePanel = false
    }
    
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController]  {
         let usersVC = settingsStoryboard.instantiateViewController(withIdentifier: String(describing: TQSettingsExistingUsersListVC.self)) as! TQSettingsExistingUsersListVC
        
        let invitedVC = settingsStoryboard.instantiateViewController(withIdentifier: String(describing: TQSettingsInvitedUsersListVC.self)) as! TQSettingsInvitedUsersListVC
       
        
        return [usersVC,invitedVC]
       
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
