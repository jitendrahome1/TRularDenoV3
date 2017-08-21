//
//  TQQuoteProductListVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 22/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQQuoteProductListVC: TQBaseViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.tableView.estimatedRowHeight = 90
//        self.tableView.rowHeight = UITableViewAutomaticDimension
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.hideNavigationBar = false
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackGray"), barTintColor: .white, itemTintColor: .lightGray,isBarTranslucent: false)
        
        self.setNavigationTitle(title: "ID: 3454778 "+bulletUnicode+" v 2.0", titleColor: .colorWithHexString("#404041"), subtitle: "Date: 12/04/2017 "+bulletUnicode+"Due date: 18/04/2017", subtitleColor: .colorWithHexString("#404041"))
        
        self.setRightBarButtonText(text: "Open", textColor: .white, backgroundColor: .colorWithHexString("#F48E1F"), showBorder: false, borderColor: .clear)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK:- UITableView Datasource & Delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 2:
            return 3
        default:
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let productInfoCell:TQProductInfoCell = self.tableView.dequeueReusableCell(withIdentifier: "TQProductInfoCell") as! TQProductInfoCell
        
        let summaryCell = self.tableView.dequeueReusableCell(withIdentifier: "summaryCell")
        
        let totalAmountCell = self.tableView.dequeueReusableCell(withIdentifier: "totalAmountCell")
        
        let discountCell = self.tableView.dequeueReusableCell(withIdentifier: "discountCell")
        
        switch indexPath.section {
        case 1:
            
            switch indexPath.row {
            case 0:
                productInfoCell.productHeadingLbl.text = "Premium Account 6 Months"
                productInfoCell.productPriceLbl.text = "$499.00"
                productInfoCell.productStatusImgVw.image = #imageLiteral(resourceName: "redCircle")

                return productInfoCell
                
            default:
                productInfoCell.productHeadingLbl.text = "Premium Account 30 Days"
                productInfoCell.productPriceLbl.text = "$19.99"
                productInfoCell.productStatusImgVw.image = #imageLiteral(resourceName: "redCircle")
                return productInfoCell
            }
            
        case 2:
            
            switch indexPath.row {
            case 0:
                return summaryCell!
            case 1:
                return totalAmountCell!
            default:
                let vw = discountCell?.viewWithTag(5111) as! UIView
                vw.layer.cornerRadius = 2
                vw.layer.borderColor = UIColor.colorWithHexString("#DEE5F0").cgColor
                vw.layer.borderWidth = 0.5
                return discountCell!
            }
            
        default:
            productInfoCell.productHeadingLbl.text = "Premium Account 1 year"
            productInfoCell.productPriceLbl.text = "$799.00"
            productInfoCell.productStatusImgVw.image = #imageLiteral(resourceName: "greenCircle")
            return productInfoCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        TQNavigationHelper.sharedInstance.pushViewController(storyboard: quotesStoryboard, viewController: String(describing: TQQuoteProductDetailsVC.self))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 2 {
            
            switch indexPath.row {
            case 0:
                return 117
            case 1:
                return 76
            default:
                return 100
            }
        } else {
            return 105
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 2 {
            return 0
        } else {
            return 70
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        var cellView = UIView()
        
        let headerCell:TQProductHeaderCell = self.tableView.dequeueReusableCell(withIdentifier: "TQProductHeaderCell") as! TQProductHeaderCell
        headerCell.autoresizingMask = [.flexibleWidth,.flexibleHeight]

        switch section {
        case 0:
            headerCell.headerDetailsLbl.text = "Special premium account offer"
            
        default:
            headerCell.headerDetailsLbl.text = "Premium account offer"
        }
        
        cellView = headerCell
        cellView.backgroundColor = .white

        return cellView
    }
}
