//
//  TQDashboardNewsfeedVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 02/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQDashboardNewsfeedVC: UIViewController,IndicatorInfoProvider,UITableViewDataSource,UITableViewDelegate {

    var datasource:[[String:String]]!
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        datasource =      [["id":"ID: 464565","notifDetails":"Heather McNamara changed status to Away"],
                          ["id":"ID: 454656","notifDetails":"Marcus Besson added note to quote nr. 464565"],
                          ["id":"ID: 454656","notifDetails":"You received a new message for quote nr. 464565"],
                          ["id":"ID: 464565","notifDetails":"Marcus Besson added note to quote nr. 464565"],
                          ["id":"ID: 454656","notifDetails":"Heather McNamara changed status to Away"],
                          ["id":"ID: 454656","notifDetails":"You received a new message for quote nr. 464565"]]
        
//        self.tableView.estimatedRowHeight = 73.0
//        self.tableView.rowHeight = UITableViewAutomaticDimension
    
        // Do any additional setup after loading the view.
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if datasource.count > 0 {
            
            let newsfeedNotifcationCell : TQNewsfeedNotifcationCell = self.tableView.dequeueReusableCell(withIdentifier: "newsfeedNotifcationCell") as! TQNewsfeedNotifcationCell
            
            newsfeedNotifcationCell.dataSource = datasource[indexPath.row] as AnyObject
            
            return newsfeedNotifcationCell
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
            return "FRIDAY"
        default:
            return "TODAY"
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header = view as! UITableViewHeaderFooterView
        
        header.textLabel?.font = UIFont.init(name: BOLD_FONT_NAME, size: 10.0)
        header.textLabel?.textColor = UIColor.colorWithHexString("#a8acbb")
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.white
        
            }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        guard datasource != nil else {
            return 73.0
        }
        
        if datasource.count > 0 {
            return 73.0
        } else {
        return self.tableView.frame.height
        }
    }
    
    //MARK:- Tab Pager Delegate
    //For Title
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        
        return IndicatorInfo.init(title: "NEWSFEED")
    }
    
}
