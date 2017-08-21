//
//  TQAnalyticsLeaderboardVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 29/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQAnalyticsLeaderboardVC: UIViewController,UITableViewDelegate,UITableViewDataSource,IndicatorInfoProvider {

    var datasource:[[String:String]]!
    var hitrateDatasource:[[String:String]]!

    @IBOutlet var tableView: UITableView!    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tableView.estimatedRowHeight = 95.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        datasource = [
        ["name":"Jennifer North","rank":"1","email":"jenny_north@vans.com","value":"4,565"],
        ["name":"Heather McNamara","rank":"2","email":"heather@vans.com","value":"4,564"],
        ["name":"Jason Williams","rank":"3","email":"jason_williams@vans.com","value":"4,563"],
        ["name":"Marcus Besson","rank":"4","email":"marcus_b@vans.com","value":"4,562"],
        ["name":"Ellen Stonebridge","rank":"5","email":"ellen_stonebridge@vans.com","value":"4,561"]]
        
        hitrateDatasource = [
            ["name":"Jennifer North","rank":"1","email":"jenny_north@vans.com","value":"78%"],
            ["name":"Heather McNamara","rank":"2","email":"Heather@vans.com","value":"70%"],
            ["name":"Jason Williams","rank":"3","email":"jason_williams@vans.com","value":"62%"]]
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        let dic = ["Controller":"2"]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: ANALYTICS_CHILD_NOTIFICATION), object: nil,userInfo:dic)
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
        if section == 0 {
            return datasource.count
        } else {
            return hitrateDatasource.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let analyticsLeaderboardCell : TQAnalyticsLeaderboardCell = self.tableView.dequeueReusableCell(withIdentifier: "analyticsLeaderboardCell") as! TQAnalyticsLeaderboardCell
        
        if indexPath.section == 0 {
            analyticsLeaderboardCell.dataSource = datasource[indexPath.row] as AnyObject

        } else {
            analyticsLeaderboardCell.dataSource = hitrateDatasource[indexPath.row] as AnyObject
        }
        
        return analyticsLeaderboardCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "SENT"
        default:
            return "HITRATE"
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header = view as! UITableViewHeaderFooterView
        
        header.textLabel?.font = UIFont.init(name: BOLD_FONT_NAME, size: 10.0)
        header.textLabel?.textColor = UIColor.colorWithHexString("#a8acbb")
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.white
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    //MARK:- Tab Pager Delegate
    @IBAction func filterAction(_ sender: UIButton) {
        
        TQFilterPopupVC.showFiltersWith(self, filtersArray: [["VALUE","AMOUNT"]], preSelected: "ALL", position: .bottomLeft, width: .regular, center: CGPoint.init(x: 20, y: sender.frame.height)) { (selected, idx) in
            print(selected!,idx!)
        }
    }
    
    //MARK:- Tab Pager Delegate
    //For Title
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo.init(title: "LEADERBOARD")
    }
  
}
