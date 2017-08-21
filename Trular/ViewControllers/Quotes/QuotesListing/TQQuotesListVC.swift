//
//  TQQuotesListVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 13/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQQuotesListVC: TQBaseViewController,IndicatorInfoProvider,UITableViewDelegate,UITableViewDataSource {

    var datasource:[[String:String]]!
    
    var pDictItems = [String:AnyObject]()
    var arrItems = [AnyObject]()
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        datasource = [["amount":"$40,899","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc."],
                           ["amount":"$225,999","notifDetails":"Marcus Besson "+bulletUnicode+" HBO Europe"],
                           ["amount":"$3,399","notifDetails":"Jason Williams "+bulletUnicode+" Etnies™ "]]
   
        let sectionValue = ["CHANGE OWNER", "ASSISTANT"]
        let nameValue = ["HeatherMcNamara", "Jason Willams"]
        let statusValue = ["Not confirmed", "Confirmed"]
        
        for index in 0..<sectionValue.count{
            pDictItems = ["SectionTitle":sectionValue[index] as AnyObject,"name":nameValue[index] as AnyObject, "status":statusValue[index] as AnyObject]
        self.arrItems.append(pDictItems as AnyObject)
        }        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.setLeftNavigationButtons(leftButtonType: .Menu, backImage: nil, barTintColor: .white, itemTintColor: .colorWithHexString("#404041"),isBarTranslucent: false)
        
        self.setNavigationTitle(title: "Quotes", titleColor: .colorWithHexString("#404041"), subtitle: "Company"+bulletUnicode+"All"+bulletUnicode+"Year", subtitleColor: .lightGray)
        
        self.setNotificationBtn(notificationCount: 0)
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
        switch section {
        case 0:
            return 1
        default:
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if datasource.count > 0 {
            
            let quotesListCell : TQQuotesListCell = self.tableView.dequeueReusableCell(withIdentifier: "quotesListCell") as! TQQuotesListCell
            
            quotesListCell.dataSource = datasource[indexPath.row + indexPath.section] as AnyObject
            
            quotesListCell.rightButtons = [
                MGSwipeButton(title: "", icon: #imageLiteral(resourceName: "not_interested"), backgroundColor: .colorWithHexString("#EC4030")),
                MGSwipeButton(title: "", icon: #imageLiteral(resourceName: "signText"), backgroundColor: .colorWithHexString("#91C569")),
                MGSwipeButton(title: "", icon: #imageLiteral(resourceName: "see_quote"), backgroundColor: .colorWithHexString("#008BFF")),
                MGSwipeButton(title: "", icon: #imageLiteral(resourceName: "message_client"), backgroundColor: .colorWithHexString("#DEE5F0"))]
            
            quotesListCell.rightSwipeSettings.transition = .drag
            
            return quotesListCell
        } else {
            
            let noDataCell  = self.tableView.dequeueReusableCell(withIdentifier: "noDataCell")!
            
            return noDataCell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "TODAY"
        case 1:
            return "YESTERDAY"
            
        default:
            return "TODAY"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard datasource != nil else {
            return 82.0
        }
        
        if datasource.count > 0 {
            return 82.0
        } else {
            return self.tableView.frame.height }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header = view as! UITableViewHeaderFooterView
        
        header.textLabel?.font = UIFont.init(name: BOLD_FONT_NAME, size: 10.0)
        header.textLabel?.textColor = UIColor.colorWithHexString("#a8acbb")
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.white
    }
    
    //MARK:- Tab Pager Delegate
    //For Title
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo.init(title: "QUOTES")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
       /* TQQuotesPopUpVC.showQuotesPopUp(self, pArrValue: self.arrItems) {
            
        }*/
        
        TQNavigationHelper.sharedInstance.pushViewController(storyboard: quotesStoryboard, viewController: String(describing: TQQuoteViewVC.self))
    }
    
    //MARK:- Button Actions
    
    @IBAction func newQuoteAction(_ sender: UIButton) {
        
        TQNavigationHelper.sharedInstance.pushViewController(storyboard: quotesStoryboard, viewController: String(describing: TQNewQuoteOptionVC.self))
    }
}
