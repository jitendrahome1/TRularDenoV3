//
//  TQNewQuoteFromInquiryVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 31/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQNewQuoteFromInquiryVC: TQBaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var aTableView: UITableView!
    
    var datasource:[[String:String]]!
    var datasource2:[[String:String]]!
    var datasource3:[[String:String]]!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackGray"), barTintColor: .white, itemTintColor: .lightGray,isBarTranslucent: false)
        
        self.setNavigationTitle(title: "New Quote", titleColor: .colorWithHexString("#404041"), subtitle: "From an inquiry", subtitleColor: .lightGray)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.UISetup()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:- UI Setup Function
    
    func UISetup(){
        datasource = [["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","isNew":"1","status":"New"],
                      ["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","isNew":"1","status":"New"],
                      ["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","isNew":"1","status":"New"]]
        
        datasource3 = [["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","isNew":"0","status":"Assigned"],
                       ["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","isNew":"0","status":"Assigned"],
                       ["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","isNew":"0","status":"Assigned"]]
        
        datasource2 = [["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","isNew":"0","status":"Assigned"],
                       ["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","isNew":"0","status":"Assigned"],
                       ["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","isNew":"0","status":"Assigned"],
                       ["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","isNew":"0","status":"Assigned"],
                       ["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","isNew":"0","status":"Assigned"],
                       ["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","isNew":"0","status":"Assigned"],
                       ["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","isNew":"0","status":"Assigned"],
                       ["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","isNew":"0","status":"Assigned"],
                       ["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc.","isNew":"0","status":"Assigned"]]
    }
    //MARK:- Tableview Datasource and Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return datasource.count
        case 1:
            return datasource3.count
        default:
            return datasource2.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let inquiriesListCell : TQInquiriesListCell = self.aTableView.dequeueReusableCell(withIdentifier: "TQInquiriesListCell") as! TQInquiriesListCell
        
        if indexPath.section == 0 {
            inquiriesListCell.dataSource = datasource[indexPath.row] as AnyObject
        } else if indexPath.section == 1 {
            inquiriesListCell.dataSource = datasource3[indexPath.row] as AnyObject
        } else {
            inquiriesListCell.dataSource = datasource2[indexPath.row] as AnyObject
        }
        
        return inquiriesListCell
    }
    
    /*else {
     
     let noDataCell  = self.aTableView.dequeueReusableCell(withIdentifier: "noDataCell")!
     
     return noDataCell
     }*/
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "INCOMING INQUIRIES (3)"
        case 1:
            return "TODAY"
        case 2:
            return "YESTERDAY"
            
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82.0
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header = view as! UITableViewHeaderFooterView
        
        header.textLabel?.font = UIFont.init(name: BOLD_FONT_NAME, size: 10.0)
        header.textLabel?.textColor = UIColor.colorWithHexString("#a8acbb")
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.white
    }
}


