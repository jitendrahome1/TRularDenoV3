//
//  TQQuoteDiscountVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 02/08/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQQuoteDiscountVC: TQBaseViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    //MARK:- UITableView Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let switchCell:TQQuoteDiscountSwitchCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing:TQQuoteDiscountSwitchCell.self)) as! TQQuoteDiscountSwitchCell
        
        let textCell:TQQuoteDiscountTextCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing:TQQuoteDiscountTextCell.self)) as! TQQuoteDiscountTextCell
        
        let durationCell:TQQuoteDiscountDurationCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing:TQQuoteDiscountDurationCell.self)) as! TQQuoteDiscountDurationCell

        switch indexPath.row {
        case 0:
            switchCell.textLbl.text = "Value"
            switchCell.switchBtn.isSelected = true
            return switchCell
        case 1:
            switchCell.textLbl.text = "Amount"
            switchCell.switchBtn.isSelected = false
            return switchCell
        case 2:
            return durationCell
        case 3:
            return textCell
        default:
            return switchCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 71
    }
    
}
