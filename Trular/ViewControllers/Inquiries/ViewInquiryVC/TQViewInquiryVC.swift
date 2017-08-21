//
//  TQViewInquiryVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 16/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQViewInquiryVC: TQBaseTableViewController {

    @IBOutlet var assignBtn: UIButton!
    @IBOutlet var notInterestedBtn: UIButton!
    @IBOutlet var removeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.assignBtn.layer.cornerRadius = 2
        self.notInterestedBtn.layer.cornerRadius = 2
        self.removeBtn.layer.cornerRadius = 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackGray"), barTintColor: .white, itemTintColor: .colorWithHexString("#404041"),isBarTranslucent: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
