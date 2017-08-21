//
//  TQQuoteSummaryTableVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 22/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQQuoteSummaryTableVC: UITableViewController {

    @IBOutlet var discountView: UIView!
    @IBOutlet var readTermsButton: UIButton!
    @IBOutlet var fillInfoButton: UIButton!
    @IBOutlet var productsListButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.discountView.layer.cornerRadius = 2
        self.discountView.layer.borderColor = UIColor.colorWithHexString("#DEE5F0").cgColor
        self.discountView.layer.borderWidth = 0.5
        
        self.readTermsButton.layer.cornerRadius = 2
        self.readTermsButton.layer.borderColor = UIColor.colorWithHexString("#DEE5F0").cgColor
        self.readTermsButton.layer.borderWidth = 0.5

        self.fillInfoButton.layer.cornerRadius = 2
        self.fillInfoButton.layer.borderColor = UIColor.colorWithHexString("#DEE5F0").cgColor
        self.fillInfoButton.layer.borderWidth = 0.5
        
        self.productsListButton.layer.cornerRadius = 2
        self.productsListButton.layer.borderColor = UIColor.colorWithHexString("#DEE5F0").cgColor
        self.productsListButton.layer.borderWidth = 0.5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Button Actions
    
    @IBAction func showProductsList(_ sender: UIButton) {
        
        TQNavigationHelper.sharedInstance.pushViewController(storyboard: quotesStoryboard, viewController: String(describing: TQQuoteProductListVC.self))
    }
    
    @IBAction func showQuoteTerms(_ sender: UIButton) {
        
        TQNavigationHelper.sharedInstance.pushViewController(storyboard: quotesStoryboard, viewController: String(describing: TQQuoteTermsVC.self))
    }
    
    @IBAction func showCustomerInfo(_ sender: UIButton) {
        
        TQNavigationHelper.sharedInstance.pushViewController(storyboard: quotesStoryboard, viewController: String(describing: TQQuoteCustomerInfoVC.self))
    }
}
