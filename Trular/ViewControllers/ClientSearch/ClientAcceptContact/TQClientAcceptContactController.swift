//
//  TQClientAcceptContactController.swift
//  Trular
//
//  Created by Jitendra on 6/13/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQClientAcceptContactController: TQBaseViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var lblClientTitle: UILabel!
    
    @IBOutlet weak var aTableView: UITableView!
    @IBOutlet weak var lblClientSubTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
     self.tabBarController?.tabBar.isHidden = true
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
            cell  = self.aTableView.dequeueReusableCell(withIdentifier: "TQClientAcceptCell") as! TQClientAcceptCell
        case 1:
            cell  = self.aTableView.dequeueReusableCell(withIdentifier: "TQClientAcceptFullProfile") as! TQClientAcceptCell
             (cell as! TQClientAcceptCell).btnClientFullProfile.layer.borderWidth = 1.0
             (cell as! TQClientAcceptCell).btnClientFullProfile.layer.borderColor = UIColor.white.cgColor
        default: break
        }
        
    return cell!
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 90.0
        case 1:
            return 76.0
        default: break
        }
        return 0.0
    }
   
}
