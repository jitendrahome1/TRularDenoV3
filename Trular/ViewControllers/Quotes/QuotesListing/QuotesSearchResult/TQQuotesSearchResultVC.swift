//
//  TQQuotesSearchResultVC.swift
//  Trular
//
//  Created by Jitendra on 6/19/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQQuotesSearchResultVC: TQBaseViewController,UITableViewDataSource,UITableViewDelegate, UITextFieldDelegate  {

    @IBOutlet weak var aTableView: UITableView!
      var sectionsTitle  = [String]()
    var isSearchEnable: Bool = false
    var searchCell: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        searchCell = 0
        sectionsTitle = ["CHANGE OWNER","ASSISTANT"]
        self.aTableView.register(UINib(nibName:"TQJASearchCell", bundle: nil), forCellReuseIdentifier:"TQJASearchCell")

        self.UISetup()
        
        // Do any additional setup after loading the view.
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
    func UISetup(){
        
    }
    
    //MARK:- Tableview Datasource and Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return searchCell!
        }
        else{
           return 1
        }
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            var cell: TQBaseTableViewCell?
        if indexPath.section == 0{
             cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TQJASearchCell.self), for: indexPath) as! TQJASearchCell
            (cell as! TQJASearchCell).textSearchItems.delegate = self
        }
        else{
          cell  = self.aTableView.dequeueReusableCell(withIdentifier: "TQQuotesSearchResultCell") as! TQQuotesSearchResultCell
        }
        
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0{
            return nil
        }else{
           return sectionsTitle[section]  
        }
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        }else{
        return 60
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header = view as! UITableViewHeaderFooterView
        
        header.textLabel?.font = UIFont.init(name: BOLD_FONT_NAME, size: 10.0)
        header.textLabel?.textColor = UIColor.colorWithHexString("#a8acbb")
        
        
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.white
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
   
   func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    if isSearchEnable == false{
        searchCell = 1
        self.aTableView.reloadData()
    }
    isSearchEnable = true
   
    }
}
// MARK:- UITextField Delegete
extension TQQuotesSearchResultVC{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true;
    }
   
}

