//
//  TQSelectTimezoneVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 18/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQSelectTimezoneVC: TQBaseViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var saveBtn: UIButton!
    @IBOutlet var searchView: UIView!
    
//    var datasource:[[String:String]]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        datasource = [["gmt":"Meeting","timezoneName":"Forenade Arabemiraten","isSelected":"0"],
//                      ["gmt":"Meeting","timezoneName":"Forenade Arabemiraten","isSelected":"0"],
        
        self.saveBtn.layer.cornerRadius = 2
        self.searchView.layer.cornerRadius = 2
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // Do any additional setup after loading the view.
        
        self.showSidePanel = false
        self.hideNavigationBar = false
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackGray"), barTintColor: .white, itemTintColor: .lightGray,isBarTranslucent: false)
        
        self.setNavigationTitle(title: "Calendar", titleColor: .colorWithHexString("#404041"), subtitle: "Create an event"+bulletUnicode+"Timezone", subtitleColor: .lightGray)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- UITableView Delegate & Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let selectTimezoneCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing:TQSelectTimezoneCell.self)) as! TQSelectTimezoneCell
        
//        eventTypeCell.dataSource = self.datasource[indexPath.row] as AnyObject
        
        return selectTimezoneCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    //MARK:- Button Actions
    @IBAction func saveAction(_ sender: UIButton) {
        TQNavigationHelper.sharedInstance.contentMainNavVC.popViewController(animated: true)
    }
}
