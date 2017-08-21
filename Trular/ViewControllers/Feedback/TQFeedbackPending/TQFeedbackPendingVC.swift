//
//  TQFeedbackPendingVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 28/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQFeedbackPendingVC: UIViewController,IndicatorInfoProvider,UITableViewDataSource,UITableViewDelegate {

    var datasource:[[String:AnyObject]]!

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        datasource =
            [["image":#imageLiteral(resourceName: "clientDummy"),"amount":"$399,256" as AnyObject,"name":"Viggo Svenson"+bulletUnicode+"Netflix Inc" as AnyObject,"status":"Finshed" as AnyObject],
             ["image":#imageLiteral(resourceName: "clientDummy2"),"amount":"$6,600" as AnyObject,"name":"Ellen Stonebridge"+bulletUnicode+"Dropbox" as AnyObject,"status":"Finshed" as AnyObject]]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Tableview Datasource and Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let feedbackPendingCell:TQFeedbackPendingCell = self.tableView.dequeueReusableCell(withIdentifier: "TQFeedbackPendingCell") as! TQFeedbackPendingCell
        feedbackPendingCell.dataSource = self.datasource[indexPath.row] as AnyObject
        
        return feedbackPendingCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 82.0
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
        
        return IndicatorInfo(title: "PENDING")
    }
}
