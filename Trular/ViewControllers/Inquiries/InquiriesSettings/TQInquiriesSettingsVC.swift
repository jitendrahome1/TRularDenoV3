//
//  TQInquiriesSettingsVC.swift
//  Trular
//
//  Created by Jitendra on 6/15/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQInquiriesSettingsVC: TQBaseViewController, UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var aTableView: UITableView!
        var arrTitleHeader1 = [String]()
        var arrTitleHeader2 = [String]()
       var sectionsTitle  = [String]()
    @IBOutlet weak var btnSave: UIButton!
    
    override func viewDidLoad() {
        self.UISetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.hideNavigationBar = false
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackBlack"), barTintColor: .white, itemTintColor: .colorWithHexString("#404041"),isBarTranslucent: false)
        
        self.setNavigationTitle(title: "New Inquiry", titleColor: .colorWithHexString("#404041"), subtitle: "Choose Branch", subtitleColor: .lightGray)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionSave(_ sender: UIButton) {
    }
    // MARK:- UI Setup Function
    
    func UISetup(){
        arrTitleHeader1 =  ["Company"]
         arrTitleHeader2 =  ["Dubai","New York","Los Angeles","Stockholm"]
        sectionsTitle = ["BRANCH"]
        self.btnSave.layer.cornerRadius = 2
        self.btnSave.clipsToBounds = true
        
    }
    //MARK:- Tableview Datasource and Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 4
        default: break
            
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let inquriCell : TQInquiriesSettingsCell = self.aTableView.dequeueReusableCell(withIdentifier: "TQInquiriesSettingsCell") as! TQInquiriesSettingsCell
        if indexPath.section == 0{
            inquriCell.dataSource = self.arrTitleHeader1[indexPath.section] as AnyObject
        }else{
          inquriCell.dataSource = self.arrTitleHeader2[indexPath.row] as AnyObject
        }
        
        return inquriCell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return nil
        case 1:
            return self.sectionsTitle[0]
        default: break
            
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            return 60
        case 1:
            return 70
        default: break
            
        }
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header = view as! UITableViewHeaderFooterView
        
        header.textLabel?.font = UIFont.init(name: BOLD_FONT_NAME, size: 10.0)
        header.textLabel?.textColor = UIColor.colorWithHexString("#a8acbb")
        
        
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.white
    }
  
}
