//
//  TQLeaderboardUsersVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 28/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQLeaderboardUsersVC: UIViewController,IndicatorInfoProvider,UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate {

    @IBOutlet var tableView: UITableView!
    
    var datasource:[[String:String]]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
         datasource =      [["rank":"2","name":"Ellen Stonebridge","email":"ellen_stonebridge@vans.com"],
                           ["rank":"3","name":"Heather McNamara","email":"heather@vans.com"],
                           ["rank":"4","name":"Viggo Svenson","email":"viggo@spotify.com"],
                           ["rank":"5","name":"Marcus Besson","email":"marcus_b@spotify.com"]]
        
        let longPressGesture:UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.longPress(_:)))
        longPressGesture.minimumPressDuration = 0.5 // 1 second press
        longPressGesture.delegate = self
        self.tableView.addGestureRecognizer(longPressGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let dic = ["Controller":"1"]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: LEADERBOARD_CHILD_NOTIFICATION), object: nil,userInfo:dic)
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
        
        let leaderboardUserCell : TQLeaderboardUserCell = self.tableView.dequeueReusableCell(withIdentifier: "TQLeaderboardUserCell") as! TQLeaderboardUserCell
        
        leaderboardUserCell.dataSource = self.datasource[indexPath.row] as AnyObject
        
        return leaderboardUserCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        TQNavigationHelper.sharedInstance.pushViewController(storyboard: leaderboardStoryboard, viewController: String(describing:TQLeaderboardUserSummaryVC.self))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    //MARK:- Gesture Handler
    func longPress(_ longPressGestureRecognizer: UILongPressGestureRecognizer) {
        
        if longPressGestureRecognizer.state == UIGestureRecognizerState.began {
            
            let touchPoint = longPressGestureRecognizer.location(in: nil)
            /*if let indexPath = tableView.indexPathForRow(at: touchPoint) {
                
                // your code here, get the row for the indexPath or do whatever you want
            }*/
            
            TQFilterPopupVC.showFiltersWith(self, filtersArray: [["VALUE","AMOUNT"],["SENT","SIGNED VALUE","OPEN VALUE","HITRATE","INQUIRY RESPONSE TIME","MESSAGE RESPONSE TIME","AVERAGE FEEDBACK"]], preSelected: "ALL", position: .freeform, width: .wide, center: CGPoint.init(x: SCREEN_WIDTH - 20, y: touchPoint.y)) { (selected, idx) in
                print(selected!,idx!)
            }
        }
    }
    
    //MARK:- Tab Pager Delegate
    //For Title
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo.init(title: "USERS")
    }
    
}
