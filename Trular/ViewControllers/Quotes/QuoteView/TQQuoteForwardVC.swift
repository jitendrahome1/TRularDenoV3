//
//  TQQuoteForwardVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 27/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQQuoteForwardVC: UIViewController,IndicatorInfoProvider,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var sendBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.sendBtn.layer.cornerRadius = 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- TableView Delegate & Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let emailSearchCell = self.tableView.dequeueReusableCell(withIdentifier: "emailSearchCell")
        
        let resultCell = self.tableView.dequeueReusableCell(withIdentifier: "resultCell")
        
        if indexPath.row == 0 {
            return emailSearchCell!
        } else {
            return resultCell!
        }
    }    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return 84
        } else {
            return 72
        }
    }
    
    //MARK:- Tab Pager Delegate
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo.init(title: "FORWARD")
    }
    
}
