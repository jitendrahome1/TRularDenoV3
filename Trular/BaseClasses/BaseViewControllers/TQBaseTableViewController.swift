//
//  TQBaseTableViewController.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 02/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import SideMenu

class TQBaseTableViewController: UITableViewController {
    var barButtonArray = [UIBarButtonItem]()
    let barButtonWidth =   IS_IPAD() ? 50 : 25
    var rightNavigationItemArray = Array<UIBarButtonItem>()
    
    var showSidePanel: Bool? {
        
        didSet {
            
            TQHelper.sharedInstance.showSidePanel = showSidePanel!
        }
    }
    
    var hideNavigationBar: Bool? {
        
        didSet {
            
            TQHelper.sharedInstance.showNavigationBar = hideNavigationBar!
            TQNavigationHelper.sharedInstance.contentMainNavVC?.isNavigationBarHidden = hideNavigationBar!
        }
    }
    
    //MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setLeftNavigationButtons(leftButtonType:LeftButtonType, backImage:UIImage?,barTintColor:UIColor,itemTintColor:UIColor, isBarTranslucent:Bool) {
        
        self.navigationItem.leftBarButtonItem = nil
        
        switch leftButtonType {
        case .Back:
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: backImage!, style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.actionBack))
        case .Menu:
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Hamburger"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.actionMenu))
        }
        
        self.navigationController?.navigationBar.barTintColor = barTintColor
        self.navigationController?.navigationBar.tintColor = itemTintColor
        self.navigationController?.navigationBar.isTranslucent = isBarTranslucent
        
        if isBarTranslucent {
            self.navigationController?.view.backgroundColor = barTintColor
            self.navigationController?.navigationBar.backgroundColor = barTintColor
        }
    }
    
    func setNotificationBtn(notificationCount:Int) {
        
        rightNavigationItemArray.removeAll()
        
        let notificationButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "Notification"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.actionNotification))
        rightNavigationItemArray.append(notificationButton)
        
        if  notificationCount > 0 {
            
            let notifCountBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 25))
            let notifCountBarBtn = UIBarButtonItem()
            
            notifCountBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 11.0)
            notifCountBtn.setTitleColor(UIColor.colorWithHexString("#404041"), for: .normal)
            notifCountBtn.setImage(UIImage.init(named: "redCircle"), for: .normal)
            notifCountBtn.contentEdgeInsets = UIEdgeInsetsMake(5, 10, 5, 7)
            notifCountBtn.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: -5, bottom: 0, right: 0)
            
            notifCountBtn.layer.cornerRadius = notifCountBtn.frame.height / 2
            notifCountBtn.layer.borderWidth = 0.3
            notifCountBtn.layer.borderColor = UIColor.lightGray.cgColor
            
            notifCountBtn.setTitle("\(notificationCount)", for: .normal)
            notifCountBtn.sizeToFit()
            notifCountBarBtn.customView = notifCountBtn
            rightNavigationItemArray.append(notifCountBarBtn)
        }
        
        self.navigationItem.rightBarButtonItems = nil
        self.navigationItem.rightBarButtonItems = rightNavigationItemArray
    }
    
    func setNavigationTitle(title:String, titleColor:UIColor,subtitle:String, subtitleColor:UIColor) {
        
        let fullTitle = NSMutableAttributedString()
        
        let titleString = NSAttributedString(string: title as String, attributes: [NSFontAttributeName:UIFont.boldSystemFont(ofSize: 16),NSForegroundColorAttributeName: titleColor])
        fullTitle.append(titleString)
        
        if subtitle.characters.count > 0 {
            
            let subtitleString = NSAttributedString(string: "\n"+subtitle as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 10),NSForegroundColorAttributeName: subtitleColor])
            fullTitle.append(subtitleString)
        }
        
        let navTextView = UIView()
        
        let titleLbl = UILabel()
        titleLbl.attributedText = fullTitle
        titleLbl.textAlignment = .center
        titleLbl.numberOfLines = 0
        titleLbl.lineBreakMode = .byWordWrapping
        titleLbl.sizeToFit()
        
        let titleBtn = UIButton.init(frame: titleLbl.frame)
        titleBtn.addTarget(self, action: #selector(self.tapHeader(sender:)), for: .touchUpInside)
        navTextView.frame = titleLbl.frame
        
        navTextView.addSubview(titleLbl)
        navTextView.addSubview(titleBtn)
        
        self.navigationItem.titleView = nil
        self.navigationItem.titleView = navTextView
    }
    
    func setRightBarButtonText(text:String,textColor:UIColor, backgroundColor:UIColor, showBorder:Bool,borderColor:UIColor) {
        
        let textLbl = UILabel()
        textLbl.frame = CGRect.init(x: SCREEN_WIDTH - 15, y: 48.0, width: 50.0, height: 21.0)
        
        textLbl.attributedText = NSAttributedString(string: text, attributes: [NSFontAttributeName:UIFont.init(name: "HelveticaNeue-Bold", size: 10.0)!,NSForegroundColorAttributeName: textColor])
        textLbl.textAlignment = .center
        textLbl.layer.cornerRadius = 4
        textLbl.clipsToBounds = true
        textLbl.backgroundColor = backgroundColor
        
        if showBorder {
            textLbl.layer.borderColor = borderColor.cgColor
            textLbl.layer.borderWidth = 0.5
        }
        
        self.navigationItem.rightBarButtonItems = nil
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: textLbl)
    }
    
    func setTopicImage(profileImage:UIImage, userCount:Int) {
        
        let topicView = UIView()
        
        let profileImgVw = UIImageView.init(image: profileImage)
        profileImgVw.frame = CGRect.init(x: 0, y: 0, width: 38, height: 38)
        profileImgVw.layer.cornerRadius = 19
        profileImgVw.clipsToBounds = true
        profileImgVw.contentMode = .scaleAspectFit
        
        let userCountLbl = UILabel()
        
        if userCount >= 100 {
            userCountLbl.text = "+99"
        } else {
            userCountLbl.text = "+" + "\(userCount)"
        }
        
        userCountLbl.backgroundColor = UIColor.colorWithHexString("#91C569")
        userCountLbl.textColor = .white
        userCountLbl.font = UIFont.init(name: "HelveticaNeue-Regular", size: 7.0)
        userCountLbl.sizeToFit()
        userCountLbl.frame = CGRect.init(x: 18.0, y: 0.0, width: 20.0, height: 10.0)
        
        topicView.addSubview(profileImgVw)
        topicView.addSubview(userCountLbl)
        
        self.navigationItem.rightBarButtonItems = nil
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: topicView)
    }
    
    //MARK:- Navigation Bar Button Actions
    
    func actionNotification() {
        TQNavigationHelper.sharedInstance.pushViewController(storyboard: dashboardStoryboard, viewController: String(describing:TQNotificationsVC.self))
    }
    
    func actionMenu() {
        TQNavigationHelper.sharedInstance.contentMainNavVC.present(SideMenuManager.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
    func actionBack() {
        TQNavigationHelper.sharedInstance.contentMainNavVC.popViewController(animated: true)
    }
    
    func tapHeader(sender: UIButton){
        print("header Tap Action")
    }
}

