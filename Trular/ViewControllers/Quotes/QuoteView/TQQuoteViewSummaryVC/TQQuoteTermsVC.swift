//
//  TQQuoteTermsVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 26/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQQuoteTermsVC: TQBaseViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var iAgreeBtn: UIButton!    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.iAgreeBtn.layer.cornerRadius = 2
        
        self.tableView.estimatedRowHeight = 50
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.hideNavigationBar = false
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackGray"), barTintColor: .white, itemTintColor: .lightGray,isBarTranslucent: false)
        
        self.setNavigationTitle(title: "ID: 3454778 "+bulletUnicode+" v 2.0", titleColor: UIColor.colorWithHexString("#404041"), subtitle: "Date: 12/04/2017 "+bulletUnicode+"Due date: 18/04/2017", subtitleColor: .lightGray)
        
        self.setRightBarButtonText(text: "Open", textColor: .white, backgroundColor: .colorWithHexString("#F48E1F"), showBorder: false, borderColor: .clear)
    }
    
    //MARK:- TableView Delegate & Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let briefInfoCell = self.tableView.dequeueReusableCell(withIdentifier: "fullInfoCell")
        
        let fullInfoCell = self.tableView.dequeueReusableCell(withIdentifier: "fullInfoCell")
        
        if indexPath.row == 0 {
            return fullInfoCell!
        } else {
            return briefInfoCell!
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    //Button Actions
    @IBAction func termsAgreeAction(_ sender: UIButton) {
        
    }
}
