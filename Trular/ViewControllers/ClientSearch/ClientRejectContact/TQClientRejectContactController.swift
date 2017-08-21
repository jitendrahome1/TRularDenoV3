//
//  TQClientRejectContactController.swift
//  Trular
//
//  Created by Jitendra on 6/13/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQClientRejectContactController: TQBaseViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var aTableView: UITableView!
    @IBOutlet weak var lblClientTitle: UILabel!
    
    @IBOutlet weak var lblClientSubTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.aTableView.rowHeight = UITableViewAutomaticDimension;
        self.aTableView.estimatedRowHeight = 96.0
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackBlack"), barTintColor: .white, itemTintColor: .colorWithHexString("#404041"),isBarTranslucent: false)
        
        self.setNavigationTitle(title: TQHelper.sharedInstance.currentUserType == .Client ? "Clients" : "Vendor", titleColor: .colorWithHexString("#404041"), subtitle: "Company"+bulletUnicode+"All Clients", subtitleColor: .lightGray)
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
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        var cell: TQBaseTableViewCell?
        switch indexPath.section {
        case 0:
            cell  = self.aTableView.dequeueReusableCell(withIdentifier: "TQClientRejectCell") as! TQClientRejectCell
        case 1:
            cell  = self.aTableView.dequeueReusableCell(withIdentifier: "TQClientRejectDescription") as! TQClientRejectCell
            (cell as! TQClientRejectCell).lblRectDescription.text = "Hey You! Bring to the table win-win survial strategies. to"
        default: break
        }
        
        
       
        
        
        return cell!
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
        return 90.0
        case 1:
        return UITableViewAutomaticDimension
        default: break
        }
        return 0.0
    }
}
