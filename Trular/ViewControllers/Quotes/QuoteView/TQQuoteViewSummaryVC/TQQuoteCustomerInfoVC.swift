//
//  TQQuoteCustomerInfoVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 27/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQQuoteCustomerInfoVC: TQBaseViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var sendBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.sendBtn.layer.cornerRadius = 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.hideNavigationBar = false
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackGray"), barTintColor: .white, itemTintColor: .lightGray, isBarTranslucent: false)
        
        self.setNavigationTitle(title: "ID: 3454778 "+bulletUnicode+" v 2.0", titleColor: UIColor.colorWithHexString("#404041"), subtitle: "Date: 12/04/2017 "+bulletUnicode+"Due date: 18/04/2017", subtitleColor: .lightGray)
        
        self.setRightBarButtonText(text: "Open", textColor: .white, backgroundColor: .colorWithHexString("#F48E1F"), showBorder: false, borderColor: .clear)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- TableView Delegate & Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let defaultFieldCell = self.tableView.dequeueReusableCell(withIdentifier: "fieldCell")
        
        return defaultFieldCell!
    }
}
