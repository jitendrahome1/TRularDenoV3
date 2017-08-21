//
//  TQLeaderboardBranchesVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 28/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQLeaderboardBranchesVC: UIViewController,IndicatorInfoProvider,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    var datasource:[[String:String]]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        datasource =      [["rank":"2","name":"Stockholm","email":"Sweden"],
                           ["rank":"3","name":"Dubai","email":"United Arab Emirates"],
                           ["rank":"4","name":"New York, NY","email":"United States of America"]]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let dic = ["Controller":"2"]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: LEADERBOARD_CHILD_NOTIFICATION), object: nil,userInfo:dic)
    }
    
    //MARK:- Tableview Datasource and Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let leaderboardUserCell : TQLeaderboardUserCell = self.tableView.dequeueReusableCell(withIdentifier: "TQLeaderboardUserCell") as! TQLeaderboardUserCell
        
        leaderboardUserCell.dataSource = self.datasource[indexPath.row] as AnyObject
        
        return leaderboardUserCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    //MARK:- Filter Action
    @IBAction func showFilters(_ sender: UIButton) {
        
        TQFilterPopupVC.showFiltersWith(self, filtersArray: [["ALL","INCOMING","NEW","ASSIGNED"]], preSelected: "ALL", position: .bottomRight, width: .regular, center: CGPoint.init(x: SCREEN_WIDTH - 20, y: sender.frame.height)) { (selected, idx) in
            print(selected!,idx!)
        }
    }
    //MARK:- Tab Pager Delegate
    //For Title
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo.init(title: "BRANCHES")
    }
}
