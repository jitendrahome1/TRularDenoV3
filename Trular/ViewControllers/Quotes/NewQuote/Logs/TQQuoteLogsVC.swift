//
//  TQQuoteLogsVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 03/08/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQQuoteLogsVC: UIViewController,IndicatorInfoProvider,UITableViewDelegate,UITableViewDataSource {

    var datasource:[[String:String]]!
    
    @IBOutlet var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        datasource = [["headerTitle":"INQUIRY","date":"04/04/2017"+bulletUnicode+"10:25","ownerDetails":"Heather McNamara"+bulletUnicode+"Netflix Inc.","statusColor":"#008BFF"],
                      ["headerTitle":"ASSIGNED","date":"04/04/2017"+bulletUnicode+"10:25","ownerDetails":"Heather McNamara"+bulletUnicode+"Netflix Inc.","statusColor":"#60acd9"],
                      ["headerTitle":"QUOTE CREATED","date":"04/04/2017"+bulletUnicode+"10:25","ownerDetails":"Heather McNamara"+bulletUnicode+"Netflix Inc.","statusColor":"#6cb2bd"],
                      ["headerTitle":"QUOTE SENT","date":"04/04/2017"+bulletUnicode+"10:25","ownerDetails":"Heather McNamara"+bulletUnicode+"Netflix Inc.","statusColor":"#79b9a0"],
                      ["headerTitle":"QUOTE VIEWED","date":"04/04/2017"+bulletUnicode+"10:25","ownerDetails":"Heather McNamara"+bulletUnicode+"Netflix Inc.","statusColor":"#85bf84"],
                      ["headerTitle":"QUOTE SIGNED","date":"04/04/2017"+bulletUnicode+"10:25","ownerDetails":"Heather McNamara"+bulletUnicode+"Netflix Inc.","statusColor":"#8bbf66"]]
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
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let logsCell:TQQuoteLogsCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing:TQQuoteLogsCell.self)) as! TQQuoteLogsCell
        logsCell.dataSource = self.datasource[indexPath.row] as AnyObject
        
        if indexPath.row == (self.datasource.count - 1) {
            logsCell.animatorLine.isHidden = true
        }
        
        return logsCell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.alpha = 0
        UIView.animate(withDuration: 0.2, delay: Double(indexPath.row) * 0.2, options: .curveEaseInOut, animations: {
            cell.alpha = 1
        }, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
       return 80.0
    }
    
    //MARK:- Tab Pager Delegate
    //For Title
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        
        return IndicatorInfo.init(title: "LOGS")
    }
}
