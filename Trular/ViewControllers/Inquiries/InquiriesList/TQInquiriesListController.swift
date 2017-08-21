//
//  TQInquiriesListController.swift
//  Trular
//
//  Created by Jitendra on 6/15/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQInquiriesListController: TQBaseViewController,UITableViewDelegate,UITableViewDataSource {


    @IBOutlet weak var aTableView: UITableView!
    
    @IBOutlet weak var btnAddNewInquiry: UIButton!
    
    @IBOutlet weak var btnFilter: UIButton!
    
    var datasource:[[String:String]]!    
    var datasource2:[[String:String]]!
    var datasource3:[[String:String]]!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.setLeftNavigationButtons(leftButtonType: .Menu, backImage: nil, barTintColor: .white, itemTintColor: .colorWithHexString("#404041"),isBarTranslucent: false)
        
        self.setNavigationTitle(title: "Inquiries", titleColor: .colorWithHexString("#404041"), subtitle: "Company"+bulletUnicode+"All"+bulletUnicode+"Year", subtitleColor: .lightGray)
        
        self.setNotificationBtn(notificationCount: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.UISetup()
    
        datasource = [["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","isNew":"1","status":"New"],
                      ["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","isNew":"1","status":"New"],
                      ["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","isNew":"1","status":"New"]]
        
        datasource3 = [["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","isNew":"0","status":"Assigned"],
                      ["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","isNew":"0","status":"Assigned"],
                      ["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","isNew":"0","status":"Assigned"]]
        
        datasource2 = [["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","isNew":"0","status":"Assigned"],
                      ["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","isNew":"0","status":"Assigned"],
                      ["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","isNew":"0","status":"Assigned"],
                      ["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","isNew":"0","status":"Assigned"],
                      ["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","isNew":"0","status":"Assigned"],
                      ["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","isNew":"0","status":"Assigned"],
                      ["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","isNew":"0","status":"Assigned"],
                      ["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","isNew":"0","status":"Assigned"],
                      ["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","isNew":"0","status":"Assigned"]]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:- UI Setup Function
    
    func UISetup(){
    }
    //MARK:- Tableview Datasource and Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return datasource.count
        case 1:
            return datasource3.count
        default:
            return datasource2.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let inquiriesListCell : TQInquiriesListCell = self.aTableView.dequeueReusableCell(withIdentifier: "TQInquiriesListCell") as! TQInquiriesListCell
        
        if indexPath.section == 0 {
            inquiriesListCell.dataSource = datasource[indexPath.row] as AnyObject
        } else if indexPath.section == 1 {
            inquiriesListCell.dataSource = datasource3[indexPath.row] as AnyObject
        } else {
            inquiriesListCell.dataSource = datasource2[indexPath.row] as AnyObject
        }
        
        switch indexPath.section {
        case 0:
            
            let removeBtn = MGSwipeButton(title: "Hide", icon:#imageLiteral(resourceName: "remove") , backgroundColor: .colorWithHexString("#EC4030"))
            removeBtn.tintColor = .white
            removeBtn.titleLabel?.font = UIFont.init(name: MEDIUM_FONT_NAME, size: 10.0)
            removeBtn.centerVertically()
            removeBtn.buttonWidth = 0
            
            let notInterestedBtn = MGSwipeButton(title: "Not Interested", icon:#imageLiteral(resourceName: "notInterested") , backgroundColor: .colorWithHexString("#F48E1F"))
            notInterestedBtn.tintColor = .white
            notInterestedBtn.titleLabel?.font = UIFont.init(name: MEDIUM_FONT_NAME, size: 10.0)
            notInterestedBtn.centerVertically()
            notInterestedBtn.buttonWidth = 0
            
            let assignBtn = MGSwipeButton(title: "Assign", icon:#imageLiteral(resourceName: "assign") , backgroundColor: .colorWithHexString("#91C569"))
            assignBtn.tintColor = .white
            assignBtn.titleLabel?.font = UIFont.init(name: MEDIUM_FONT_NAME, size: 10.0)
            assignBtn.centerVertically()
            assignBtn.buttonWidth = 0
            
            inquiriesListCell.rightButtons = [
                removeBtn,
                notInterestedBtn,
                assignBtn]
            
            inquiriesListCell.rightSwipeSettings.transition = .drag
            
        default:
            let hideBtn = MGSwipeButton(title: "Hide", icon:#imageLiteral(resourceName: "remove") , backgroundColor: .colorWithHexString("#EC4030"))
            hideBtn.tintColor = .white
            hideBtn.titleLabel?.font = UIFont.init(name: MEDIUM_FONT_NAME, size: 10.0)
            hideBtn.centerVertically()
            hideBtn.buttonWidth = 0
            
            
            let messageBtn = MGSwipeButton(title: "Message", icon:#imageLiteral(resourceName: "btm_chat_normal") , backgroundColor: .colorWithHexString("#DEE5F0"))
            messageBtn.tintColor = .colorWithHexString("#404041")
            messageBtn.titleLabel?.font = UIFont.init(name: MEDIUM_FONT_NAME, size: 10.0)
            messageBtn.setTitleColor(.colorWithHexString("#404041"), for: .normal)
            messageBtn.centerVertically()
            messageBtn.buttonWidth = 0
            
            let quoteBtn = MGSwipeButton(title: "Quote", icon:#imageLiteral(resourceName: "edit_icon") , backgroundColor: .colorWithHexString("#008BFF"))
            quoteBtn.tintColor = .white
            quoteBtn.titleLabel?.font = UIFont.init(name: MEDIUM_FONT_NAME, size: 10.0)
            quoteBtn.centerVertically()
            quoteBtn.buttonWidth = 0
            
            inquiriesListCell.rightButtons = [hideBtn,messageBtn,quoteBtn]
            
            inquiriesListCell.rightSwipeSettings.transition = .drag
        }
        
        return inquiriesListCell
    }
    
        /*else {
    
            let noDataCell  = self.aTableView.dequeueReusableCell(withIdentifier: "noDataCell")!
     
            return noDataCell
        }*/
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "INCOMING INQUIRIES (3)"
        case 1:
            return "TODAY"
        case 2:
            return "YESTERDAY"
            
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82.0
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header = view as! UITableViewHeaderFooterView
        
        header.textLabel?.font = UIFont.init(name: BOLD_FONT_NAME, size: 10.0)
        header.textLabel?.textColor = UIColor.colorWithHexString("#a8acbb")
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.white
    }
    
    //MARK:- Button Actions
    
    @IBAction func showFilters(_ sender: UIButton) {
        
        TQFilterPopupVC.showFiltersWith(self, filtersArray: [["ALL","INCOMING","NEW","ASSIGNED"]], preSelected: "ALL", position: .bottomLeft, width: .regular, center: CGPoint.init(x: 20, y: sender.frame.height)) { (selected, idx) in
            print(selected!,idx!)
        }
    }

    @IBAction func actionAddNewInquiry(_ sender: UIButton) {
        
        TQNavigationHelper.sharedInstance.pushViewController(storyboard: inquiriesStoryboard, viewController: String(describing: TQAddNewInquiryVC.self))
    }
    
}
