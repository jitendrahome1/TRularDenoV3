//
//  TQQuoteViewSummaryVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 21/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQQuoteViewSummaryVC: UIViewController,IndicatorInfoProvider {

    @IBOutlet var signBtn: UIButton!
    @IBOutlet var refuseBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.signBtn.layer.cornerRadius = 2
        self.refuseBtn.layer.cornerRadius = 2
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo.init(title: "QUOTE")
    }
}
