//
//  TQDashboardActivityStreamVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 02/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQDashboardActivityStreamVC: UIViewController,IndicatorInfoProvider,UITableViewDelegate,UITableViewDataSource {

    var datasource:[[String:String]]!
    
    @IBOutlet var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        datasource = [["name":"Viggo Svenson "+bulletUnicode,"company":" Spotify","notifDetails":"Hi, i saw the latest quote and I have some questions","readCount":"09","unreadCount":"12"],
                      ["name":"Viggo Svenson "+bulletUnicode,"company":" Spotify","notifDetails":"Hi, i saw the latest quote and I have some questions","readCount":"09","unreadCount":"12"],
                      ["name":"Viggo Svenson "+bulletUnicode,"company":" Spotify","notifDetails":"Hi, i saw the latest quote and I have some questions","readCount":"09","unreadCount":"12"]]
        
//        self.tableView.estimatedRowHeight = 82.0
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
            
            let activityStreamCell : TQActivityStreamCell = self.tableView.dequeueReusableCell(withIdentifier: "activityStreamCell") as! TQActivityStreamCell
            
            activityStreamCell.dataSource = datasource[indexPath.row] as AnyObject
            
            return activityStreamCell
        } else {
            
            let noDataCell  = self.tableView.dequeueReusableCell(withIdentifier: "noDataCell")!
            
            return noDataCell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "UNREAD MESSAGES"
            
        default:
            return "UNREAD MESSAGES"
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
        return IndicatorInfo.init(title: "ACTIVITY STREAM")
    }
}
