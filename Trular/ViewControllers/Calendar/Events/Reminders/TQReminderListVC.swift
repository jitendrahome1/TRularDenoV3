//
//  TQReminderListVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 17/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQReminderListVC: TQBaseViewController,UITableViewDataSource,UITableViewDelegate {

    var datasource:[[String:String]]!
    
    @IBOutlet var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        datasource =  [["invitationType":"Chat","notifDetails":"Chat with customer","isNew":"0"],
                       ["invitationType":"Call","notifDetails":"Call with customer","isNew":"0"]]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // Do any additional setup after loading the view.
        
        self.showSidePanel = true
        self.hideNavigationBar = false
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackGray"), barTintColor: .white, itemTintColor: .lightGray,isBarTranslucent: false)
        
        self.setNavigationTitle(title: "Calendar", titleColor: .colorWithHexString("#404041"), subtitle: "Company"+bulletUnicode+"Stockholm", subtitleColor: .lightGray)
        
        self.setNotificationBtn(notificationCount: 0)
    }

    //MARK:- Tableview Datasource and Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if datasource.count > 0 {
            
            let messagesListCell : TQReceivedInvitationsCell = self.tableView.dequeueReusableCell(withIdentifier: "TQReceivedInvitationsCell") as! TQReceivedInvitationsCell
            
            messagesListCell.dataSource = datasource[indexPath.row] as AnyObject
            
            return messagesListCell
        } else {
            
            let noDataCell  = self.tableView.dequeueReusableCell(withIdentifier: "noDataCell")!
            
            return noDataCell
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
    
}
