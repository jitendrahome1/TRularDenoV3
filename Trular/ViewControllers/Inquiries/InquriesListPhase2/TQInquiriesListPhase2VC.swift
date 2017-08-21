//
//  TQInquiriesListPhase2VC.swift
//  Trular
//
//  Created by Jitendra on 6/15/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQInquiriesListPhase2VC: TQBaseViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var aTableView: UITableView!
     var arrSectionsTitle  = [String]()
    var datasource:[[String:String]]!
    override func viewDidLoad() {
        super.viewDidLoad()
             self.UISetup()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func UISetup(){
        self.btnEdit.layer.cornerRadius = self.btnEdit.frame.height/2
                datasource = [["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc."],
                              ["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc."],
                              ["id":"ID: 7658879","notifDetails":"Heather McNamara "+bulletUnicode+" Netflix Inc."]]
          self.arrSectionsTitle = ["TODAY","YESTERDAY","SUTURDAY"]
        
    }
    //MARK:- Tableview Datasource and Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
     
            return 2
       
            
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if datasource.count > 0 {
            
            let inquiriesListCell : TQInquriesListPhase2Cell = self.aTableView.dequeueReusableCell(withIdentifier: "TQInquriesListPhase2Cell") as! TQInquriesListPhase2Cell
            inquiriesListCell.dataSource = datasource[indexPath.row] as AnyObject
            
            
            return inquiriesListCell
        }
            
            
        else {
            
            let noDataCell  = self.aTableView.dequeueReusableCell(withIdentifier: "noDataCell")!
            
            return noDataCell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return self.arrSectionsTitle[section]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard datasource != nil else {
            return 73.0
        }
        
        if datasource.count > 0 {
            return 73.0
        } else {
            return self.aTableView.frame.height }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header = view as! UITableViewHeaderFooterView
        
        header.textLabel?.font = UIFont.init(name: BOLD_FONT_NAME, size: 10.0)
        header.textLabel?.textColor = UIColor.colorWithHexString("#a8acbb")
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.white
    }
    
    

}
