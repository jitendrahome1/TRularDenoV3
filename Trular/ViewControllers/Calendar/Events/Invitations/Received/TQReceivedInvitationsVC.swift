//
//  TQReceivedInvitationsVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 17/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQReceivedInvitationsVC: UIViewController,IndicatorInfoProvider,UITableViewDataSource,UITableViewDelegate {
    
    var datasource:[[[String:String]]]!
    
    @IBOutlet var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        datasource = [[["invitationType":"Meeting","notifDetails":"Meeting with customer","isNew":"0"]],
                      [["invitationType":"Chat","notifDetails":"Chat with customer","isNew":"0"],
                      ["invitationType":"Call","notifDetails":"Call with customer","isNew":"0"]],
                      [["invitationType":"Chat","notifDetails":"Chat with customer","isNew":"0"],
                      ["invitationType":"Call","notifDetails":"Call with customer","isNew":"0"]]]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Tableview Datasource and Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let eventViewVC : TQEventViewVC = quotesStoryboard.instantiateViewController(withIdentifier: String(describing: TQEventViewVC.self)) as! TQEventViewVC
        eventViewVC.invitationSource = .received
        TQNavigationHelper.sharedInstance.contentMainNavVC.pushViewController(eventViewVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if datasource.count > 0 {
            
            let messagesListCell : TQReceivedInvitationsCell = self.tableView.dequeueReusableCell(withIdentifier: "TQReceivedInvitationsCell") as! TQReceivedInvitationsCell
            
            let acceptBtn = MGSwipeButton(title: "Accept", icon:#imageLiteral(resourceName: "ok_only_clients") , backgroundColor: .colorWithHexString("#91C569"))
            acceptBtn.tintColor = .white
            acceptBtn.titleLabel?.font = UIFont.init(name: MEDIUM_FONT_NAME, size: 10.0)
            acceptBtn.centerVertically()
            acceptBtn.buttonWidth = 0
            
            let refuseBtn = MGSwipeButton(title: "Refuse", icon:#imageLiteral(resourceName: "close_only_clients") , backgroundColor: .colorWithHexString("#E42825"))
            refuseBtn.tintColor = .white
            refuseBtn.titleLabel?.font = UIFont.init(name: MEDIUM_FONT_NAME, size: 10.0)
            refuseBtn.centerVertically()
            refuseBtn.buttonWidth = 0

            messagesListCell.rightButtons = [
                refuseBtn,
                acceptBtn]
            
            messagesListCell.rightSwipeSettings.transition = .drag
            
            messagesListCell.dataSource = datasource[indexPath.section][indexPath.row] as AnyObject
            
            return messagesListCell
        } else {
            
            let noDataCell  = self.tableView.dequeueReusableCell(withIdentifier: "noDataCell")!
            
            return noDataCell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "TODAY"
        case 1:
            return "YESTERDAY"
        case 2:
            return "SATURDAY"
        default:
            return "TODAY"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard datasource != nil else {
            return 82.0
        }
        
        if datasource.count > 0 {
            return 82.0
        } else {
            return self.tableView.frame.height }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header = view as! UITableViewHeaderFooterView
        
        header.textLabel?.font = UIFont.init(name: BOLD_FONT_NAME, size: 10.0)
        header.textLabel?.textColor = UIColor.colorWithHexString("#a8acbb")
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.white
    }
    
    //MARK:- Tab Pager Delegate
    //For Title
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo.init(title: "RECEIVED", image: #imageLiteral(resourceName: "greenCircle"))
    }
}
