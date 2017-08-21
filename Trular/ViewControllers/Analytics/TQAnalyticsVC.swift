//
//  TQAnalyticsVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 29/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQAnalyticsVC: TQBasePagerVC,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var colorVw: UIView!
    @IBOutlet var tableView: UITableView!

    @IBOutlet var chartTableViewHeightConstraint: NSLayoutConstraint!
    
    
    //MARK:- View Lifecycle
    override func viewDidLoad() {
        self.barColor = .clear
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.hideNavigationBar = false
        
        self.setLeftNavigationButtons(leftButtonType: .Menu, backImage: #imageLiteral(resourceName: "BackWhite"), barTintColor: .colorWithHexString("#91C569"), itemTintColor: .white,isBarTranslucent: false)
        
        self.setNavigationTitle(title: "Analytics", titleColor: .white, subtitle: "ID: 456454", subtitleColor: .white)
        
        self.showSidePanel = false
        self.pagerShouldScroll = true
//        NotificationCenter.default.addObserver(self, selector: #selector(self.ChildViewAction(_:)), name: NSNotification.Name(rawValue: ANALYTICS_CHILD_NOTIFICATION), object: nil)
    }
   
    override func viewWillDisappear(_ animated: Bool) {
        
//        NotificationCenter.default.removeObserver(self, name:NSNotification.Name(rawValue:ANALYTICS_CHILD_NOTIFICATION ), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Pager UI
    func updatePagerUI(isBackgroundWhite:Bool) {
        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            
            guard changeCurrentIndex == true else { return }
            
            if isBackgroundWhite {
                
                oldCell?.label.textColor = .lightGray
                oldCell?.label.font = UIFont.init(name: MEDIUM_FONT_NAME, size: 12.0)
                oldCell?.separatorView.isHidden = false
                newCell?.label.textColor = .colorWithHexString("#404041")
                newCell?.label.font = UIFont.init(name: MEDIUM_FONT_NAME, size: 12.0)
                newCell?.separatorView.isHidden = false
                
            } else {
                
                oldCell?.label.textColor = UIColor.colorWithHexString("#B2D796")
                oldCell?.label.font = UIFont.init(name: MEDIUM_FONT_NAME, size: 12.0)
                oldCell?.separatorView.isHidden = true
                newCell?.label.textColor = UIColor.white
                newCell?.label.font = UIFont.init(name: MEDIUM_FONT_NAME, size: 12.0)
                newCell?.separatorView.isHidden = true
            }
        }
    }
    
    //MARK:- Notification Handler
    func ChildViewAction(_ notification: NSNotification) {
        
        setupUI(notification.userInfo!["Controller"] as! String)
    }
    
    //MARK:- UI Setup
    func setupUI(_ index:String) {
        
        switch index {
        case "1":
            
            self.setLeftNavigationButtons(leftButtonType: .Menu, backImage: #imageLiteral(resourceName: "BackWhite"), barTintColor: .colorWithHexString("#91C569"), itemTintColor: .white,isBarTranslucent: false)
            
            self.setNavigationTitle(title: "Vendors", titleColor: .white, subtitle: "ID: 456454", subtitleColor: .white)
            self.colorVw.backgroundColor = .colorWithHexString("#91C569")
            self.buttonBarView.backgroundColor = .colorWithHexString("#91C569")
            self.buttonBarView.selectedBar.backgroundColor = UIColor.clear
            self.buttonBarView.reloadData()
            self.updatePagerUI(isBackgroundWhite: false)

            self.chartTableViewHeightConstraint.constant = 250
            
            UIView.animate(withDuration: 0.1, delay: 0.0, options:.transitionCrossDissolve ,animations: {                self.view.layoutIfNeeded()
            })
            break
            
        default:
        
            self.chartTableViewHeightConstraint.constant = 0
            
            self.setLeftNavigationButtons(leftButtonType: .Menu, backImage: #imageLiteral(resourceName: "BackBlack"), barTintColor: .white, itemTintColor: .colorWithHexString("#404041"),isBarTranslucent: false)
            
            self.setNavigationTitle(title: "Vendors", titleColor: .colorWithHexString("#404041"), subtitle: "ID: 456454", subtitleColor: .colorWithHexString("#404041"))
            self.colorVw.backgroundColor = .white
            self.buttonBarView.backgroundColor = .white
            self.buttonBarView.selectedBar.backgroundColor = UIColor.colorWithHexString("#404041")
            self.buttonBarView.reloadData()
            self.updatePagerUI(isBackgroundWhite: true)

            break
        }
    }
    
    //MARK:- Pager Delegates
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController]  {
        
        let statistics = analyticsStoryboard.instantiateViewController(withIdentifier: String(describing: TQAnalyticsStatisticsVC.self)) as! TQAnalyticsStatisticsVC
        
        let leaderboard = analyticsStoryboard.instantiateViewController(withIdentifier: String(describing: TQAnalyticsLeaderboardVC.self)) as! TQAnalyticsLeaderboardVC
        
        let comparisonIndustry = analyticsStoryboard.instantiateViewController(withIdentifier: String(describing: TQAnalyticsComparisonIndustryVC.self)) as! TQAnalyticsComparisonIndustryVC
        
        return [statistics,leaderboard,comparisonIndustry]
    }
    
    override func updateIndicator(for viewController: PagerTabStripViewController, fromIndex: Int, toIndex: Int, withProgressPercentage progressPercentage: CGFloat, indexWasChanged: Bool) {
        
        super.updateIndicator(for: viewController, fromIndex: fromIndex, toIndex: toIndex, withProgressPercentage: progressPercentage, indexWasChanged: indexWasChanged)
        
        if progressPercentage == 1.0 {
            setupUI("\(toIndex + 1)")
        }
    }
    
    //MARK:- UITableView Delegate & Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let barChartCell: TQAnalyticsBarChartCell = self.tableView.dequeueReusableCell(withIdentifier: "TQAnalyticsBarChartCell") as! TQAnalyticsBarChartCell
        barChartCell.backgroundColor = .colorWithHexString("#91C569")
        
        return barChartCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 362
    }
}

