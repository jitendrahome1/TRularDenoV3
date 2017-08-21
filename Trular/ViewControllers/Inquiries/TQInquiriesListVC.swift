//
//  TQInquiriesListVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 13/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQInquiriesListVC: UIViewController,IndicatorInfoProvider,UITableViewDelegate,UITableViewDataSource {

    var datasource:[[String:String]]!
    
    @IBOutlet var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        datasource = [["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc."],
                           ["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc."],
                           ["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc."]]
        
        //        self.tableView.estimatedRowHeight = 73.0
        //        self.tableView.rowHeight = UITableViewAutomaticDimension
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
            
            let inquiriesListCell : TQInquiriesListCell = self.tableView.dequeueReusableCell(withIdentifier: "inquiriesListCell") as! TQInquiriesListCell
            
            inquiriesListCell.dataSource = datasource[indexPath.row] as AnyObject
            
            return inquiriesListCell
        } else {
            
            let noDataCell  = self.tableView.dequeueReusableCell(withIdentifier: "noDataCell")!
            
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
            return self.tableView.frame.height }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header = view as! UITableViewHeaderFooterView
        
        header.textLabel?.font = UIFont.systemFont(ofSize: 10.0, weight: 2.0)
        header.textLabel?.textColor = UIColor.colorWithHexString("#a8acbb")
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.white
    }
    
    //MARK:- Tab Pager Delegate
    //For Title
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo.init(title: "INQUIRIES")
    }
}
