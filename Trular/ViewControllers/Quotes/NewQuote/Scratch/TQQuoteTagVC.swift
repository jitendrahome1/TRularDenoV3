//
//  TQQuoteTagVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 02/08/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQQuoteTagVC: TQBaseViewController,UITableViewDelegate,UITableViewDataSource {

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
        
        self.showSidePanel = false
        self.hideNavigationBar = false
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackGray"), barTintColor: .white, itemTintColor: .lightGray,isBarTranslucent: false)
        
        self.setNavigationTitle(title: "New Quote", titleColor: .colorWithHexString("#404041"), subtitle: "Add/edit tags", subtitleColor: .lightGray)
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
