//
//  TQAnalyticsStatisticsVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 28/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQAnalyticsStatisticsVC: UIViewController,UITableViewDelegate,UITableViewDataSource,IndicatorInfoProvider {

    var datasource:[[String:AnyObject]]!
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        datasource =     [
            ["type":"INQUIRIES" as AnyObject,"amount":"4,565" as AnyObject,"percentage":49.0 as AnyObject,"goal":0.0 as AnyObject,"currentStatus":"+49%" as AnyObject,"color":"#008bff" as AnyObject],
            
            ["type":"CANCELLED" as AnyObject,"amount":"2,353" as AnyObject,"percentage":47.0 as AnyObject,"goal":0.0 as AnyObject,"currentStatus":"+47%" as AnyObject,"color":"#FF0000" as AnyObject],
            
            ["type":"OPEN" as AnyObject,"amount":"4,576" as AnyObject,"percentage":14.0 as AnyObject,"goal":0.0 as AnyObject,"currentStatus":"-14%" as AnyObject,"color":"#F48E1F" as AnyObject],
            
            ["type":"FINISHED" as AnyObject,"amount":"342" as AnyObject,"percentage":76.0 as AnyObject,"goal":0.0 as AnyObject,"currentStatus":"-76%" as AnyObject,"color":"#D9D9D9" as AnyObject],
            
            ["type":"HITRATE(GOAL:75%)" as AnyObject,"amount":"32" as AnyObject,"percentage":50.0 as AnyObject,"goal":75.0 as AnyObject,"currentStatus":"+50%" as AnyObject,"color":"#008bff" as AnyObject]]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        let dic = ["Controller":"1"]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: ANALYTICS_CHILD_NOTIFICATION), object: nil,userInfo:dic)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- UITableView Delegate & Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let statisticsCell: TQAnalyticsStatisticsCell = self.tableView.dequeueReusableCell(withIdentifier: "TQAnalyticsStatisticsCell") as! TQAnalyticsStatisticsCell
        
//        let barChartCell: TQAnalyticsBarChartCell = self.tableView.dequeueReusableCell(withIdentifier: "TQAnalyticsBarChartCell") as! TQAnalyticsBarChartCell
//        barChartCell.backgroundColor = .colorWithHexString("#91C569")
        
//        if indexPath.row == 0 {
//            return barChartCell
//        } else {
            statisticsCell.dataSource = self.datasource[indexPath.row] as AnyObject
            return statisticsCell
//        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
//        if indexPath.row == 0 {
//            return 362
//        } else {
            return 78
//        }
    }
    
    //MARK:- Filter Action
    @IBAction func filterAction(_ sender: UIButton) {
        
        TQFilterPopupVC.showFiltersWith(self, filtersArray: [["VALUE","AMOUNT"]], preSelected: "ALL", position: .bottomLeft, width: .regular, center: CGPoint.init(x: 20, y: sender.frame.height)) { (selected, idx) in
            print(selected!,idx!)
        }
    }
    
    //MARK:- Tab Pager Delegate
    //For Title
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo.init(title: "STATISTICS")
    }
}
