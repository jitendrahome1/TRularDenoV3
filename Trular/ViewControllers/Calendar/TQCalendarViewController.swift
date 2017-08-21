//
//  TQCalendarViewController.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 10/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQCalendarViewController: TQBaseViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var calendarTypeCollectionView: UICollectionView!
    
    @IBOutlet var shadowView: UIView!
    @IBOutlet var containerView: UIView!
    @IBOutlet var collectionViewLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet var currentDayLbl: UILabel!
    @IBOutlet var currentEventsLbl: UILabel!
    
    var currentViewController = UIViewController()

    var typeArr:[CalendarType]!
    
    var isExpanded = false
    var selectedValue:CalendarType = .MONTH

    //MARK:- Child View Controllers 
    private lazy var weekViewVC: TQCalendarWeekViewVC = {
        
        // Instantiate View Controller
        var viewController = quotesStoryboard.instantiateViewController(withIdentifier: "TQCalendarWeekViewVC") as! TQCalendarWeekViewVC
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private lazy var upcomingViewVC: TQCalendarWeekViewVC = {
        
        // Instantiate View Controller
        var viewController = quotesStoryboard.instantiateViewController(withIdentifier: "TQCalendarWeekViewVC") as! TQCalendarWeekViewVC
        viewController.isForUpcoming = true
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private lazy var monthViewVC: TQCalendarMonthViewVC = {
        
        // Instantiate View Controller
        var viewController = quotesStoryboard.instantiateViewController(withIdentifier: "TQCalendarMonthViewVC") as! TQCalendarMonthViewVC
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private lazy var yearViewVC: TQCalendarYearViewVC = {
        
        // Instantiate View Controller
        var viewController = quotesStoryboard.instantiateViewController(withIdentifier: "TQCalendarYearViewVC") as! TQCalendarYearViewVC
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private lazy var dayViewVC: TQUnderConstructionVC = {
        
        // Instantiate View Controller
        var viewController = mainStoryboard.instantiateViewController(withIdentifier: String(describing:TQUnderConstructionVC.self)) as! TQUnderConstructionVC
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    //MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupDummyData()
        
        self.collectionViewLeadingConstraint.constant = SCREEN_WIDTH - 157
        self.calendarTypeCollectionView.isScrollEnabled = false
        add(asChildViewController: monthViewVC)
        self.currentViewController = monthViewVC
        
        self.currentDayLbl.text = "\(Date().dateToStringWithCustomFormat("MMMM").capitalized) " + "\(Date().getDay())" + "\(Date().getDateSuffixForDate(isUppercase:false)!)"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.setupShadow()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.hideNavigationBar = false
        
        self.setLeftNavigationButtons(leftButtonType: .Menu, backImage: #imageLiteral(resourceName: "BackWhite"), barTintColor: .white, itemTintColor: .colorWithHexString("#404041"),isBarTranslucent: false)
        
        self.setNavigationTitle(title: "Calendar", titleColor: .colorWithHexString("#404041"), subtitle: "Company"+bulletUnicode+"Stockholm", subtitleColor: .lightGray)
        
        self.setNotificationBtn(notificationCount: 0)
        
        self.showSidePanel = true
    }
    
    //MARK:- UISetup
    func setupDummyData() {
        typeArr = [.DAY,.WEEK,.MONTH,.YEAR,.UPCOMING]
    }
    
    func setupShadow() {
        self.calendarTypeCollectionView.layer.masksToBounds = true
        self.calendarTypeCollectionView.layer.cornerRadius = 2
        
        self.shadowView.layer.shadowPath = UIBezierPath.init(rect: CGRect.init(x: 0, y: 0, width: self.calendarTypeCollectionView.frame.width, height: 40)).cgPath
        self.shadowView.layer.shadowColor = UIColor.darkGray.cgColor
        self.shadowView.layer.shadowRadius = 5.0
        self.shadowView.layer.shadowOpacity = 0.5
        self.shadowView.layer.cornerRadius = 2
        self.shadowView.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
    }

    //MARK:- Add Remove Child View Controllers
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        self.addChildViewController(viewController)
        
        // Add Child View as Subview
        self.containerView.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = self.containerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParentViewController()
    }
    
    func cycleFromViewController(oldViewController: UIViewController, toViewController newViewController: UIViewController) {
        oldViewController.willMove(toParentViewController: nil)
        self.addChildViewController(newViewController)
        self.containerView.addSubview(newViewController.view)
        
        newViewController.view.frame = self.containerView.bounds
        newViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        UIView.animate(withDuration: 0.0, animations: {
            
        },completion: { finished in
            oldViewController.view.removeFromSuperview()
            oldViewController.removeFromParentViewController()
            newViewController.didMove(toParentViewController: self)
        })
    }
    
    //MARK:- CollectionView Delegate & Datasource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if self.isExpanded {
            return 5
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let typeCell : TQCalendarTypeCell = self.calendarTypeCollectionView.dequeueReusableCell(withReuseIdentifier: String(describing:TQCalendarTypeCell.self), for: indexPath) as! TQCalendarTypeCell
        
        if self.isExpanded {
            
            typeCell.selectedValue = "\(selectedValue)"
            typeCell.dataSource = typeArr[indexPath.row] as AnyObject
            
        } else {
            
            typeCell.selectedValue = "\(selectedValue)"
            typeCell.dataSource = selectedValue as AnyObject
        }
        
        return typeCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if self.isExpanded {
            
            if self.selectedValue != typeArr[indexPath.row] {
                
                self.selectedValue = typeArr[indexPath.row]
                self.updateChildViewControllers(selectedValue: selectedValue)
            }
            
            self.isExpanded = false
            self.collectionViewLeadingConstraint.constant = SCREEN_WIDTH - 157
            self.calendarTypeCollectionView.isScrollEnabled = false
            self.calendarTypeCollectionView.reloadData()
            
        } else {
            self.isExpanded = true
            self.collectionViewLeadingConstraint.constant = 20
            self.calendarTypeCollectionView.isScrollEnabled = true
            self.calendarTypeCollectionView.reloadData()
        }
        
        self.shadowView.alpha = 0

        UIView.animate(withDuration: 0.2, animations: {
            self.view.layoutIfNeeded()
            self.setupShadow()
        }) { (Bool) in
            UIView.animate(withDuration: 0.1, animations: { 
                self.shadowView.alpha = 1
            }, completion: nil)
        }
    }
    
    func updateChildViewControllers(selectedValue:CalendarType) {
        
        switch selectedValue {
        case .WEEK:
            self.cycleFromViewController(oldViewController: self.currentViewController, toViewController: weekViewVC)
            self.currentViewController = weekViewVC

        case .MONTH:
           
            self.cycleFromViewController(oldViewController: self.currentViewController, toViewController: monthViewVC)
            self.currentViewController = monthViewVC
            
        case .YEAR:
            
            self.cycleFromViewController(oldViewController: self.currentViewController, toViewController: yearViewVC)
            self.currentViewController = yearViewVC
            
        case .UPCOMING:

            self.cycleFromViewController(oldViewController: self.currentViewController, toViewController: upcomingViewVC)
            self.currentViewController = upcomingViewVC
            
        case .DAY:
            
            self.cycleFromViewController(oldViewController: self.currentViewController, toViewController: dayViewVC)
            self.currentViewController = dayViewVC
        }
    }
    
    //MARK:- Button Actions
    @IBAction func showInvitations(_ sender: UIButton) {
        
        TQNavigationHelper.sharedInstance.pushViewController(storyboard: quotesStoryboard, viewController: String(describing: TQInvitationsListVC.self))
    }
    
    @IBAction func showReminders(_ sender: UIButton) {
        
        TQNavigationHelper.sharedInstance.pushViewController(storyboard: quotesStoryboard, viewController: String(describing: TQReminderListVC.self))
    }
    
    @IBAction func addNewEventAction(_ sender: UIButton) {
        
        TQNavigationHelper.sharedInstance.pushViewController(storyboard: quotesStoryboard, viewController: String(describing: TQNewEventVC.self))
    }
}

