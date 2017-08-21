//
//  TQSettingsTermsVC.swift
//  Trular
//
//  Created by Indusnet on 14/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip


class TQSettingsTermsVC: TQBasePagerVC {
    @IBOutlet weak var btnLegal: UIButton!
    
    @IBOutlet weak var tabLegal: UILabel!
    @IBOutlet weak var tabPrivacyPolicy: UILabel!
   
    @IBOutlet weak var btnPrivacyPolicy: UIButton!
    
    @IBOutlet weak var privacyPolicyBtnAction: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.hideNavigationBar=false
          self.pagerShouldScroll = true
        
         // Do any additional setup after loading the view.
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController]  {
        let legalVC = settingsStoryboard.instantiateViewController(withIdentifier: String(describing: TQSettingsTermsLegalVC.self)) as! TQSettingsTermsLegalVC
        
        let pricayPolicyVC = settingsStoryboard.instantiateViewController(withIdentifier: String(describing: TQSettingsTermsPrivacyPolicyVC.self)) as! TQSettingsTermsPrivacyPolicyVC
        
        
        return [legalVC,pricayPolicyVC]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackGray"), barTintColor: .white, itemTintColor: .lightGray,isBarTranslucent: false)
        
        self.setNavigationTitle(title: "Settings", titleColor: .colorWithHexString("#404041"), subtitle: "", subtitleColor: .white)
        
        if TQHelper.sharedInstance.currentUserType == .VendorAdmin || TQHelper.sharedInstance.currentUserType == .ClientAdmin {
            
            self.setRightBarButtonText(text: "Admin", textColor: .colorWithHexString("#666666"), backgroundColor: .colorWithHexString("#f2f3f5"), showBorder: false, borderColor: .colorWithHexString("#f2f3f5"))
        }
        
        self.hideNavigationBar = false
        self.showSidePanel = false
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
