//
//  TQProfileStatisticsVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 13/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQProfileStatisticsVC: UIViewController,IndicatorInfoProvider,UITableViewDelegate,UITableViewDataSource {
    
    var datasource:[[String:String]]!

    @IBOutlet var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        datasource = [["type":"Quotes (4th)","value":"1,890"],["type":"Open (1st)","value":"1,890"],["type":"Cancelled (5th)","value":"1,890"],["type":"Hitrate (3rd)","value":"82%"],["type":"Signed Value (2nd)","value":"$201,890"],["type":"Signed Amount (2nd)","value":"1,890"]]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Tableview Datasource and Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let profileStatisticsCell : TQProfileStatisticsCell = self.tableView.dequeueReusableCell(withIdentifier: "profileStatisticsCell") as! TQProfileStatisticsCell
        
        profileStatisticsCell.dataSource = datasource[indexPath.row] as AnyObject
        
        return profileStatisticsCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    //MARK:- Tab Pager Delegate
    //For Title
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo.init(title: "STATISTICS")
    }

}
