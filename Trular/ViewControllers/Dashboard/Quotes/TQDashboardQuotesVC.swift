//
//  TQDashboardQuotesVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 15/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQDashboardQuotesVC: UIViewController,IndicatorInfoProvider,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var aTableView: UITableView!
    @IBOutlet var createInquiryBtn: UIButton!
    
    var datasource:[[String:String]]!
    var datasource2:[[String:String]]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        datasource = [
            ["amount":"$3,399","notifDetails":"Jason Williams "+bulletUnicode+" Etnies™","status":"Finished"],
            ["amount":"$225,999","notifDetails":"Viggo Svenson "+bulletUnicode+" Spotify Inc.","status":"Open"]]
        
        datasource2 = [
            ["amount":"$225,999","notifDetails":"Marcus Besson "+bulletUnicode+" HBO Europe","status":"Signed"],
            ["amount":"$40,899","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","status":"Cancelled"]]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Tableview Datasource and Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return datasource.count
        default:
            return datasource2.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if datasource.count > 0 {
            
            let dashboardQuotesCell : TQDashboardQuotesCell = self.aTableView.dequeueReusableCell(withIdentifier: "dashboardQuotesCell") as! TQDashboardQuotesCell
            
            dashboardQuotesCell.dataSource = datasource[indexPath.row] as AnyObject
            
            return dashboardQuotesCell
        } else {
            
            let noDataCell  = self.aTableView.dequeueReusableCell(withIdentifier: "noDataCell")!
            
            return noDataCell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "TODAY(2)"
            
        default:
            return "YESTERDAY(2)"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard datasource != nil else {
            return 73.0
        }
        
        if datasource.count > 0 {
            return 73.0
        } else {
            return self.aTableView.frame.height }
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
        
        return IndicatorInfo.init(title: "QUOTES (4)")
    }
    
}
