//
//  TQReportsUsers.swift
//  Trular
//
//  Created by Indusnet on 28/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip


class TQReportsUsers: UIViewController ,UITableViewDelegate,UITableViewDataSource,IndicatorInfoProvider {
    
    var datasource:[[String:String]]!
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self
        tableview.delegate=self
        // Do any additional setup after loading the view.
 
        datasource = [["heading":"ViggoSvenson","details":"34,645,556","color":"#91c569"],["heading":"Heather McNamara","details":"4,564,918","color":"#d55bba"],["heading":"Jannifer North","details":"1,006","color":"#84e2c4"],["heading":"Marcus Besson","details":"57","color":"#f0c709"],["heading":"Jason Williams","details":"47","color":" #f48e1f"]]
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        let dic = ["Controller":"3"]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "childNotification"), object: nil,userInfo:dic)
        
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TQreportsBranchesCell = self.tableview.dequeueReusableCell(withIdentifier: String(describing: TQreportsBranchesCell.self)) as! TQreportsBranchesCell
        
        cell.dataSource = datasource[indexPath.row] as AnyObject
        
        return cell
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
        
        
    }
    
    //MARK:- Tab Pager Delegate
    //For Title
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        
        
        return IndicatorInfo.init(title: "USERS")
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
