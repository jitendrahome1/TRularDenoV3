//
//  TQLeaderboardVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 28/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQLeaderboardVC: TQBasePagerVC {

    //For other sections
    @IBOutlet var profileBackground: UIImageView!
    @IBOutlet var userInfoStackView: UIStackView!
    @IBOutlet var currentRatingView: UIView!
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var goldMemberBadge: UIImageView!
    
    //For Branches section
    @IBOutlet var branchInfoStackView: UIStackView!
    @IBOutlet var branchRankLbl: UILabel!
    @IBOutlet var branchNameLbl: UILabel!
    @IBOutlet var branchLocationLbl: UILabel!
    
    //MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI("1")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.extendedLayoutIncludesOpaqueBars = true
        self.edgesForExtendedLayout = .top
        self.showSidePanel = true
        self.barHeight = 0.5
        self.pagerShouldScroll = true
        
        self.hideNavigationBar = false
        
        self.setLeftNavigationButtons(leftButtonType: .Menu, backImage: #imageLiteral(resourceName: "BackWhite"), barTintColor: .clear, itemTintColor: .white, isBarTranslucent: true)
        
        self.setNavigationTitle(title: "Leaderboard", titleColor: .white, subtitle: "Company"+bulletUnicode+"Month"+bulletUnicode+"Amount", subtitleColor: .white)
        
        self.setNotificationBtn(notificationCount: 0)
        
//        NotificationCenter.default.addObserver(self, selector: #selector(self.ChildViewAction(_:)), name: NSNotification.Name(rawValue: LEADERBOARD_CHILD_NOTIFICATION), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
//        NotificationCenter.default.removeObserver(self, name:NSNotification.Name(rawValue:LEADERBOARD_CHILD_NOTIFICATION ), object: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.currentRatingView.layer.cornerRadius = self.currentRatingView.frame.width / 2
        
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.width / 2
        self.profileImageView.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Notification Handler
    func ChildViewAction (_ notification: NSNotification) {
        
        setupUI(notification.userInfo!["Controller"] as! String)
    }
    
    //MARK:- UI Setup
    func setupUI(_ index:String) {
        
        switch index {
        case "1":
            self.branchInfoStackView.isHidden = true
            self.goldMemberBadge.isHidden = true
            self.profileImageView.image = #imageLiteral(resourceName: "clientDummy2")
            self.profileImageView.isHidden = false
            self.profileBackground.image = #imageLiteral(resourceName: "profileBackground")
            self.currentRatingView.isHidden = false
            self.userInfoStackView.isHidden = false

            break
        case "2":
            self.userInfoStackView.isHidden = true
            self.branchInfoStackView.isHidden = false
            self.goldMemberBadge.isHidden = true
            self.profileImageView.isHidden = true
            self.profileBackground.image = #imageLiteral(resourceName: "companyBackground")
            self.currentRatingView.isHidden = true
            break
        case "3":
            self.userInfoStackView.isHidden = false
            self.branchInfoStackView.isHidden = true
            self.goldMemberBadge.isHidden = false
            self.profileImageView.image = #imageLiteral(resourceName: "companyDummy")
            self.profileImageView.isHidden = false
            self.profileBackground.image = #imageLiteral(resourceName: "profileBackground")
            self.currentRatingView.isHidden = true

            break

        default:
            self.branchInfoStackView.isHidden = true
            self.goldMemberBadge.isHidden = true
            self.profileImageView.image = #imageLiteral(resourceName: "clientDummy2")
            self.profileImageView.isHidden = false
            self.profileBackground.image = #imageLiteral(resourceName: "profileBackground")
            self.currentRatingView.isHidden = false
            self.userInfoStackView.isHidden = false

            break
        }
    }

    //MARK:- Pager Delegates
    override func updateIndicator(for viewController: PagerTabStripViewController, fromIndex: Int, toIndex: Int, withProgressPercentage progressPercentage: CGFloat, indexWasChanged: Bool) {
        
        super.updateIndicator(for: viewController, fromIndex: fromIndex, toIndex: toIndex, withProgressPercentage: progressPercentage, indexWasChanged: indexWasChanged)
        
        if progressPercentage == 1.0 {
            setupUI("\(toIndex + 1)")
        }
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController]  {
        
        let users = leaderboardStoryboard.instantiateViewController(withIdentifier: String(describing: TQLeaderboardUsersVC.self)) as! TQLeaderboardUsersVC
        
        let branches = leaderboardStoryboard.instantiateViewController(withIdentifier: String(describing: TQLeaderboardBranchesVC.self)) as! TQLeaderboardBranchesVC
        
        let summary = leaderboardStoryboard.instantiateViewController(withIdentifier: String(describing: TQLeaderboardSummaryVC.self)) as! TQLeaderboardSummaryVC
        
        return [users,branches,summary]
    }
    
}
