//
//  TQNotificationsVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 28/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQNotificationsVC: TQBaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    var datasource:[[String:String]]!
    var datasource2:[[String:String]]!
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        datasource = [
            ["amount":"$3,399","notifDetails":"Jason Williams "+bulletUnicode+" Etnies™","status":"Finished"]]
        
        datasource2 = [
            ["amount":"$225,999","notifDetails":"Marcus Besson "+bulletUnicode+" HBO Europe","status":"Signed"],
            ["amount":"$40,899","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","status":"Cancelled"]]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.setLeftNavigationButtons(leftButtonType: .Menu, backImage: #imageLiteral(resourceName: "BackGray"), barTintColor: .white, itemTintColor: .colorWithHexString("#404041"),isBarTranslucent: false)
        
        self.setNavigationTitle(title: "Dashboard", titleColor: .colorWithHexString("#404041"), subtitle: "Company"+bulletUnicode+"Year", subtitleColor: .lightGray)
        
        self.setNotificationBtn(notificationCount: 8)
    }
    
    //MARK:- Tableview Datasource and Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return datasource2.count
        default:
            return datasource.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let selectQuoteCell : TQSelectQuoteCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing:TQSelectQuoteCell.self)) as! TQSelectQuoteCell
        
        if indexPath.section == 0 {
            selectQuoteCell.dataSource = datasource2[indexPath.row] as AnyObject
        } else {
            selectQuoteCell.dataSource = datasource[indexPath.row] as AnyObject
        }
        
        return selectQuoteCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "TODAY"
        case 1:
            return "YESTERDAY"
            
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        TQNavigationHelper.sharedInstance.contentMainNavVC.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header = view as! UITableViewHeaderFooterView
        
        header.textLabel?.font = UIFont.init(name: BOLD_FONT_NAME, size: 10.0)
        header.textLabel?.textColor = UIColor.colorWithHexString("#a8acbb")
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.white
    }
}
