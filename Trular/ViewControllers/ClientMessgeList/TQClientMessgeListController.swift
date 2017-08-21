//
//  TQClientMessgeListController.swift
//  Trular
//
//  Created by Jitendra on 6/13/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQClientMessgeListController: TQBaseViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var aTableView: UITableView!
     var sectionsTitle  = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sectionsTitle = ["TODAY","YESTERDAY","FRIDAY"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK:- Tableview Datasource and Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsTitle.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let clientListCell : TQClientMessgeListCell = self.aTableView.dequeueReusableCell(withIdentifier: "TQClientMessgeListCell") as! TQClientMessgeListCell
        clientListCell.dataSource = self.sectionsTitle[indexPath.row] as AnyObject
        
        
        return clientListCell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return self.sectionsTitle[section]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
    }
    
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header = view as! UITableViewHeaderFooterView
        
        header.textLabel?.font = UIFont.init(name: BOLD_FONT_NAME, size: 10.0)
        header.textLabel?.textColor = UIColor.colorWithHexString("#a8acbb")
        
        
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.white
    }
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
