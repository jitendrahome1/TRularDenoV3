//
//  TQQuoteViewVersionsVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 27/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQQuoteViewVersionsVC: UITableViewController,IndicatorInfoProvider {

    @IBOutlet var newVersionBtn: UIButton!
    @IBOutlet var oldVersionBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.newVersionBtn.layer.cornerRadius = 2
        self.oldVersionBtn.layer.cornerRadius = 2        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK:- Tab Pager Delegate
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo.init(title: "VERSIONS HISTORY")
    }
}
