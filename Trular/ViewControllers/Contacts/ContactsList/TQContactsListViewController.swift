//
//  TQClientsListViewController.swift
//  Trular
//
//  Created by Jitendra on 6/12/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQContactsListViewController: TQBaseViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var aTableView: UITableView!
    var sectionsTitle  = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()

//        TQNavigationHelper.sharedInstance.tabBarViewController?.tabBarShowWith(forIntinalIndex: 1)
        
        sectionsTitle = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
     
     
        self.setLeftNavigationButtons(leftButtonType: .Menu, backImage: nil, barTintColor: .white, itemTintColor: .colorWithHexString("#404041"),isBarTranslucent: false)
        
        self.setNavigationTitle(title: TQHelper.sharedInstance.currentUserType == .Client ? "Vendors": "Clients", titleColor: .colorWithHexString("#404041"), subtitle: "Company"+bulletUnicode+"All Clients", subtitleColor: .lightGray)
        
        self.setNotificationBtn(notificationCount: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Tableview Datasource and Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsTitle.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let contactsListCell : TQContactsListCell = self.aTableView.dequeueReusableCell(withIdentifier: "TQContactsListCell") as! TQContactsListCell
        
        contactsListCell.dataSource = self.sectionsTitle[indexPath.row] as AnyObject
        //configure left buttons
        
        let callBtn = MGSwipeButton(title: "Call", icon:#imageLiteral(resourceName: "btm_phone_normal") , backgroundColor: .colorWithHexString("#91C569"))
        callBtn.tintColor = .white
        callBtn.titleLabel?.font = UIFont.init(name: MEDIUM_FONT_NAME, size: 10.0)
        callBtn.centerVertically()
        callBtn.buttonWidth = 0
        
        let videoCallBtn = MGSwipeButton(title: "Video Call", icon:#imageLiteral(resourceName: "videoCall") , backgroundColor: .colorWithHexString("#008BFF"))
        videoCallBtn.tintColor = .white
        videoCallBtn.titleLabel?.font = UIFont.init(name: MEDIUM_FONT_NAME, size: 10.0)
        videoCallBtn.centerVertically()
        videoCallBtn.buttonWidth = 0
        
        contactsListCell.leftButtons = [
            callBtn,
            videoCallBtn]
        
            contactsListCell.leftSwipeSettings.transition = .drag
        
        //configure right buttons
        
        let quoteBtn = MGSwipeButton(title: "Quote", icon:#imageLiteral(resourceName: "edit_icon") , backgroundColor: .colorWithHexString("#008BFF"))
        quoteBtn.tintColor = .white
        quoteBtn.titleLabel?.font = UIFont.init(name: MEDIUM_FONT_NAME, size: 10.0)
        quoteBtn.centerVertically()
        quoteBtn.buttonWidth = 0
        
        let inquiryBtn = MGSwipeButton(title: "Inquiry", icon:#imageLiteral(resourceName: "edit_icon") , backgroundColor: .colorWithHexString("#5FC8DB"))
        inquiryBtn.tintColor = .white
        inquiryBtn.titleLabel?.font = UIFont.init(name: MEDIUM_FONT_NAME, size: 10.0)
        inquiryBtn.centerVertically()
        inquiryBtn.buttonWidth = 0
        
        let messageBtn = MGSwipeButton(title: "Message", icon:#imageLiteral(resourceName: "btm_chat_normal") , backgroundColor: .colorWithHexString("#DEE5F0"))
        messageBtn.tintColor = .colorWithHexString("#404041")
        messageBtn.titleLabel?.font = UIFont.init(name: MEDIUM_FONT_NAME, size: 10.0)
        messageBtn.setTitleColor(.colorWithHexString("#404041"), for: .normal)
        messageBtn.centerVertically()
        messageBtn.buttonWidth = 0
        
        let hideBtn = MGSwipeButton(title: "Hide", icon:#imageLiteral(resourceName: "remove") , backgroundColor: .colorWithHexString("#EC4030"))
        hideBtn.tintColor = .white
        hideBtn.titleLabel?.font = UIFont.init(name: MEDIUM_FONT_NAME, size: 10.0)
        hideBtn.centerVertically()
        hideBtn.buttonWidth = 0

        contactsListCell.rightButtons = [hideBtn,messageBtn,quoteBtn,inquiryBtn]
        
        contactsListCell.rightSwipeSettings.transition = .drag
        
        return contactsListCell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
     return self.sectionsTitle[section].uppercased()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        return 90
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header = view as! UITableViewHeaderFooterView
        
        header.textLabel?.font = UIFont.init(name: BOLD_FONT_NAME, size: 10.0)
        header.textLabel?.textColor = UIColor.colorWithHexString("#a8acbb")
        
     
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.white
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            // delete item at indexPath
        }
        
        let share = UITableViewRowAction(style: .default, title: "      ") { (action, indexPath) in
            // share item at indexPath
        }
        
        let share5 = UITableViewRowAction(style: .default, title: "jdfhgjkdhfgj") { (action, indexPath) in
            // share item at indexPath
        }
        
      //  share.backgroundColor = UIColor(patternImage: UIImage(named: "")!)
        
        return [delete, share, share5]
    }
}



