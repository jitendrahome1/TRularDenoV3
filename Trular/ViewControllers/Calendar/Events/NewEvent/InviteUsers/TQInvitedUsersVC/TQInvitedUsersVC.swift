//
//  TQInvitedUsersVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 20/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQInvitedUsersVC: TQBaseViewController,UITableViewDelegate,UITableViewDataSource,IndicatorInfoProvider {

    @IBOutlet var tableView: UITableView!
    
    var datasource:[[String:String]]!
    var datasource2:[[String:String]]!

    @IBOutlet var saveBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datasource = [["name":"Viggo Svenson","companyy":"Spotify Inc.","email":"viggo_svenson@potify.com"],
                      ["name":"Marcus Besson","companyy":"HBO Europe","email":"viggo_svenson@potify.com"],
                      ["name":"Ellen Stonebridge","companyy":"Dropbox","email":"viggo_svenson@potify.com"],
                      ["name":"Jennifer North","companyy":"Vans","email":"viggo_svenson@potify.com"],
                      ["name":"Heather McNamara","companyy":"Netflix","email":"viggo_svenson@potify.com"]]
        
        datasource2 = [["name":"Alexander Molnet","companyy":"Spotify Inc.","email":"viggo_svenson@potify.com"]]
        
        self.tableView.reloadData()
        
        self.saveBtn.layer.cornerRadius = 2
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- TableView Datasource and Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return datasource.count
        } else {
            return datasource2.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let invitedUsersCell : TQInvitedUsersCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing:TQInvitedUsersCell.self)) as! TQInvitedUsersCell
        
        if indexPath.section == 0 {
             invitedUsersCell.dataSource = datasource[indexPath.row] as AnyObject
        } else {
             invitedUsersCell.dataSource = datasource2[indexPath.row] as AnyObject
        }
        
        let removeBtn = MGSwipeButton(title: "Remove", icon:#imageLiteral(resourceName: "removeBold") , backgroundColor: .colorWithHexString("#EC4030"))
        removeBtn.tintColor = .white
        removeBtn.titleLabel?.font = UIFont.init(name: MEDIUM_FONT_NAME, size: 10.0)
        removeBtn.centerVertically()
        removeBtn.buttonWidth = 0
        
        invitedUsersCell.rightButtons = [removeBtn]
        
        invitedUsersCell.rightSwipeSettings.transition = .drag
        
        return invitedUsersCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return ""
        } else {
            return "INVITED BY E-MAIL"
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header = view as! UITableViewHeaderFooterView
        
        header.textLabel?.font = UIFont.init(name: BOLD_FONT_NAME, size: 10.0)
        header.textLabel?.textColor = UIColor.colorWithHexString("#a8acbb")
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.white
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82.0
    }
    
    //MARK:- Tab Pager Delegate
    //For Title
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo.init(title: "INVITED (3)")
    }
    
    //MARK:- Button Actions
    @IBAction func saveBtnAction(_ sender: UIButton) {
        
        TQNavigationHelper.sharedInstance.contentMainNavVC.popViewController(animated: true)
    }
}
