//
//  TQLeaderboardSummaryVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 28/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQLeaderboardSummaryVC: UIViewController,IndicatorInfoProvider,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    var datasource:[[String:String]]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        datasource =      [["name":"Sent","value":"1,890"],
                           ["name":"Signed Value","value":"$529,890"],
                           ["name":"Open Value","value":"12,499"],
                           ["name":"Hitrate","value":"80%"],
                           ["name":"Inquiry Response Time","value":"20h"],
                           ["name":"Message Response Time","value":"09h"],
                           ["name":"Average Feedback","value":"4.9"]]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let dic = ["Controller":"3"]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: LEADERBOARD_CHILD_NOTIFICATION), object: nil,userInfo:dic)
    }
    
    //MARK:- Tableview Datasource and Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let summaryCell : TQLeaderboardSummaryCell = self.tableView.dequeueReusableCell(withIdentifier: "TQLeaderboardSummaryCell") as! TQLeaderboardSummaryCell
        summaryCell.dataSource = self.datasource[indexPath.row] as AnyObject
        
        return summaryCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    //MARK:- Tab Pager Delegate
    //For Title
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo.init(title: "SUMMARY")
    }
}
