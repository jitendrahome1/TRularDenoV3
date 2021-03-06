//
//  TQFeedbackSentVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 28/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQFeedbackSentVC: UIViewController,IndicatorInfoProvider,UITableViewDataSource,UITableViewDelegate {
    
    var datasource:[[String:String]]!
    var datasource2:[[String:String]]!
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        datasource =
            [["name":"Jason Williams","company":"Netflix Inc","feedback":"Whole order was finished successfully!","feedbackType":"0","isNew":"0"],
             ["name":"Jason Williams","company":"Netflix Inc","feedback":"Extremely shitty cooperation","feedbackType":"1","isNew":"0"]]
        
        datasource2 =
            [["name":"Jason Williams","company":"Netflix Inc","feedback":"Whole order was finished successfully!","feedbackType":"0","isNew":"0"],
             ["name":"Jason Williams","company":"Netflix Inc","feedback":"Whole order was finished successfully!","feedbackType":"0","isNew":"0"]]
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let feedbackSentCell : TQFeedbackSentCell = self.tableView.dequeueReusableCell(withIdentifier: "TQFeedbackSentCell") as! TQFeedbackSentCell
        
        feedbackSentCell.dataSource = datasource[indexPath.row] as AnyObject
        
        return feedbackSentCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "TODAY"
        default:
            return "YESTERDAY"
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header = view as! UITableViewHeaderFooterView
        
        header.textLabel?.font = UIFont.init(name: BOLD_FONT_NAME, size: 10.0)
        header.textLabel?.textColor = UIColor.colorWithHexString("#a8acbb")
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.white
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 91.0
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
        
        return IndicatorInfo(title: "SENT")
    }
}
