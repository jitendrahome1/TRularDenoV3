//
//  TQEventTypeVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 18/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQEventTypeVC: TQBaseViewController,UITableViewDelegate,UITableViewDataSource {

    //CallBack
    var selectedEvent:((String)->Void)?
    
    @IBOutlet weak var tableView: UITableView!
    var datasource:[[String:String]]!
    
    @IBOutlet var saveBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        datasource = [["eventType":"Meeting","isSelected":"0"],
                      ["eventType":"Chat","isSelected":"0"],
                      ["eventType":"Call","isSelected":"0"]]
        self.saveBtn.layer.cornerRadius = 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // Do any additional setup after loading the view.
        
        self.showSidePanel = false
        self.hideNavigationBar = false
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackGray"), barTintColor: .white, itemTintColor: .lightGray,isBarTranslucent: false)
        
        self.setNavigationTitle(title: "Calendar", titleColor: .colorWithHexString("#404041"), subtitle: "Create an event"+bulletUnicode+"Event Type", subtitleColor: .lightGray)
    }
    
    //MARK:- UITableView Delegate & Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let eventTypeCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing:TQEventTypeCell.self)) as! TQEventTypeCell
        
        eventTypeCell.dataSource = self.datasource[indexPath.row] as AnyObject
        
        return eventTypeCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    //MARK:- Button Actions
    @IBAction func saveAction(_ sender: UIButton) {
        TQNavigationHelper.sharedInstance.contentMainNavVC.popViewController(animated: true)
    }
    

}
