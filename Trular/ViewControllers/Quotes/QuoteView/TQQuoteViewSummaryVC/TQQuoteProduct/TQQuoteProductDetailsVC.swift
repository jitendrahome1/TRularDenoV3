//
//  TQQuoteProductDetailsVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 22/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQQuoteProductDetailsVC: TQBaseViewController {

    @IBOutlet var textView: UITextView!
    @IBOutlet var signBtn: UIButton!
    @IBOutlet var notInterestedBtn: UIButton!
    
    var productName:String?
    var productPrice:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.signBtn.layer.cornerRadius = 2
        self.notInterestedBtn.layer.cornerRadius = 2
        
        self.textView.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.hideNavigationBar = false
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackWhite"), barTintColor: .clear, itemTintColor: .white,isBarTranslucent: true)
        
        self.setNavigationTitle(title: "ID: 3454778 "+bulletUnicode+" v 2.0", titleColor: .white, subtitle: "Date: 12/04/2017 "+bulletUnicode+"Due date: 18/04/2017", subtitleColor: .white)
        
        self.setRightBarButtonText(text: "Open", textColor: .white, backgroundColor: .colorWithHexString("#F48E1F"), showBorder: false, borderColor: .clear)
        
        self.extendedLayoutIncludesOpaqueBars = true
        self.edgesForExtendedLayout = .top
        self.showSidePanel = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
