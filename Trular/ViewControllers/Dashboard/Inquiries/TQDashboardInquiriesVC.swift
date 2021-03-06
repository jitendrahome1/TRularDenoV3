//
//  TQDashboardInquiriesVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 15/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQDashboardInquiriesVC:UIViewController,IndicatorInfoProvider,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var aTableView: UITableView!
    @IBOutlet var createInquiryBtn: UIButton!
    
    var datasource:[[String:String]]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        datasource = [["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc."],
                      ["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc."],
                      ["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc."]]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK:- Tableview Datasource and Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if datasource.count > 0 {
            
            let dashboardInquiriesCell : TQDashboardInquiriesCell = self.aTableView.dequeueReusableCell(withIdentifier: "dashboardInquiriesCell") as! TQDashboardInquiriesCell
            
            dashboardInquiriesCell.dataSource = datasource[indexPath.row] as AnyObject
            
            return dashboardInquiriesCell
        } else {
            
            let noDataCell  = self.aTableView.dequeueReusableCell(withIdentifier: "noDataCell")!
            
            return noDataCell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "INCOMING INQUIRIES"
            
        default:
            return "INCOMING INQUIRIES"
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
        
        return IndicatorInfo.init(title: "INQUIRIES (3)")
    }

}
