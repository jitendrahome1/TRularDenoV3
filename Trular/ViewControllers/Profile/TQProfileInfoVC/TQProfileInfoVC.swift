//
//  TQProfileInfoVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 13/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQProfileInfoVC: UIViewController,IndicatorInfoProvider,UITableViewDelegate,UITableViewDataSource {

    var datasource:[[String:String]]!
    
    @IBOutlet var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        datasource = [["heading":"PHONE","details":"+48 890 900 901"],["heading":"E-MAIL","details":"jenny_north@spotify.com"],["heading":"SIGNED QUOTES","details":"8,890"],["heading":"AVERAGE RESPONSE TIME FOR MESSAGE","details":"10 hours"],["heading":"AVERAGE INQUIRY RESPONSE TIME","details":"18 hours"],["heading":"LAST LOGGED IN","details":"28/04/2017 "+bulletUnicode+" 20:38"]]
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
        
        let profileInfoCell : TQProfileInfoCell = self.tableView.dequeueReusableCell(withIdentifier: "profileInfoCell") as! TQProfileInfoCell
        
        profileInfoCell.dataSource = datasource[indexPath.row] as AnyObject
        
        return profileInfoCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
    
    //MARK:- Tab Pager Delegate
    //For Title
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo.init(title: "INFO")
    }
}
