//
//  TQClientContactListController.swift
//  Trular
//
//  Created by Jitendra on 6/13/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQClientContactListController: TQBaseViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var aTableView: UITableView!
     var sectionsTitle  = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sectionsTitle = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.setLeftNavigationButtons(leftButtonType: .Menu, backImage: nil, barTintColor: .white, itemTintColor: .colorWithHexString("#404041"),isBarTranslucent: false)
        
        self.setNavigationTitle(title: TQHelper.sharedInstance.currentUserType == .Client ? "Clients" : "Vendor", titleColor: .colorWithHexString("#404041"), subtitle: "Company"+bulletUnicode+"All Clients", subtitleColor: .lightGray)
        
        self.setNotificationBtn(notificationCount: 0)
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
        
        let clientListCell : TQClientContactListCell = self.aTableView.dequeueReusableCell(withIdentifier: "TQClientContactListCell") as! TQClientContactListCell
        clientListCell.dataSource = self.sectionsTitle[indexPath.row] as AnyObject
        
        
        return clientListCell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return self.sectionsTitle[section].uppercased()
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
        
        let dict = [String: AnyObject]()
        TQClientAccptRectPopUpController.showAccptRejtPopUp(self, pDictValue: dict) {
            
        }
   
        
    }

}
