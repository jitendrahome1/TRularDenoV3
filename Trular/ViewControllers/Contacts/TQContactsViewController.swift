//
//  TQContactsViewController.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 24/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQContactsViewController: TQBaseViewController {
    
    @IBOutlet var containerView: UIView!
    var currentViewController = UIViewController()
    
    //Tab Buttons
    @IBOutlet var tabButtons: [UIButton]!
    
    var initalPage:ContactsInitialPage = .recent
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.addInitialController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.setLeftNavigationButtons(leftButtonType: .Menu, backImage: nil, barTintColor: .white, itemTintColor: .colorWithHexString("#404041"),isBarTranslucent: false)
        
        self.setNavigationTitle(title: TQHelper.sharedInstance.currentUserType == .Client ? "Vendor" : "Clients", titleColor: .colorWithHexString("#404041"), subtitle: "Company"+bulletUnicode+"All Clients", subtitleColor: .lightGray)
        
        self.setNotificationBtn(notificationCount: 0)
    }
    
    func addInitialController() {
        
        switch self.initalPage {
        case .recent:
            let contactRecentVC = userListStoryboard.instantiateViewController(withIdentifier: String(describing: TQContactsRecentController.self)) as! TQContactsRecentController
            currentViewController = contactRecentVC
            self.add(asChildViewController1: contactRecentVC)
            self.updateTabButton(tag: 1211)
            
        case .contactsList:
            let  clientContactVC = userListStoryboard.instantiateViewController(withIdentifier: String(describing: TQContactsListViewController.self)) as! TQContactsListViewController
            self.cycleFromViewController(oldViewController: self.currentViewController, toViewController: clientContactVC)
            
            self.currentViewController = clientContactVC
            self.updateTabButton(tag: 1212)
            
        case .calls:
            let clientCallHistoryVC = userListStoryboard.instantiateViewController(withIdentifier: String(describing: TQClientCallHistoryController.self)) as! TQClientCallHistoryController
            self.cycleFromViewController(oldViewController: self.currentViewController, toViewController: clientCallHistoryVC)
            
            self.currentViewController = clientCallHistoryVC
            self.updateTabButton(tag: 1213)
            
        case .messages:
            let clientMessageVC = userListStoryboard.instantiateViewController(withIdentifier: String(describing: TQClientMessgeListController.self)) as! TQClientMessgeListController
            self.cycleFromViewController(oldViewController: self.currentViewController, toViewController: clientMessageVC)
            
            self.currentViewController = clientMessageVC
            self.updateTabButton(tag: 1214)
            
        case .newContacts:
            let clientAddVC = userListStoryboard.instantiateViewController(withIdentifier: String(describing: TQClientAddedListController.self)) as! TQClientAddedListController
            self.cycleFromViewController(oldViewController: self.currentViewController, toViewController: clientAddVC)
            
            self.currentViewController = clientAddVC
            self.updateTabButton(tag: 1215)
        }
    }
    
    //MARK:- Tab Button Actions
    @IBAction func showRecentAction(_ sender: UIButton) {
        
        let contactRecentVC = userListStoryboard.instantiateViewController(withIdentifier: String(describing: TQContactsRecentController.self)) as! TQContactsRecentController
        self.cycleFromViewController(oldViewController: self.currentViewController, toViewController: contactRecentVC)
        self.currentViewController = contactRecentVC
        self.updateTabButton(tag: sender.tag)
    }
    
    @IBAction func showContactsAction(_ sender: UIButton) {
        
        let  clientContactVC = userListStoryboard.instantiateViewController(withIdentifier: String(describing: TQContactsListViewController.self)) as! TQContactsListViewController
        self.cycleFromViewController(oldViewController: self.currentViewController, toViewController: clientContactVC)
        
        self.currentViewController = clientContactVC
        self.updateTabButton(tag: sender.tag)
    }
    
    @IBAction func showCallsAction(_ sender: UIButton) {
        
        let clientCallHistoryVC = userListStoryboard.instantiateViewController(withIdentifier: String(describing: TQClientCallHistoryController.self)) as! TQClientCallHistoryController
        self.cycleFromViewController(oldViewController: self.currentViewController, toViewController: clientCallHistoryVC)
        
        self.currentViewController = clientCallHistoryVC
        self.updateTabButton(tag: sender.tag)
    }
    
    @IBAction func showMessagesAction(_ sender: UIButton) {
        
        let clientMessageVC = userListStoryboard.instantiateViewController(withIdentifier: String(describing: TQClientMessgeListController.self)) as! TQClientMessgeListController
        self.cycleFromViewController(oldViewController: self.currentViewController, toViewController: clientMessageVC)
        
        self.currentViewController = clientMessageVC
        self.updateTabButton(tag: sender.tag)
    }
    
    @IBAction func showInvitationsAction(_ sender: UIButton) {
        
        let clientAddVC = userListStoryboard.instantiateViewController(withIdentifier: String(describing: TQClientAddedListController.self)) as! TQClientAddedListController
        self.cycleFromViewController(oldViewController: self.currentViewController, toViewController: clientAddVC)
        
        self.currentViewController = clientAddVC
        self.updateTabButton(tag: sender.tag)
    }
    
    @IBAction func newContactAction(_ sender: Any) {
        
        TQNavigationHelper.sharedInstance.pushViewController(storyboard: userListStoryboard, viewController: String(describing: TQSearchClientViewController.self))
    }
    
    //MARK:- Add Remove Child View Controllers
    private func add(asChildViewController1 viewController: UIViewController) {
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
    
    private func updateTabButton(tag:Int) {
        
        for tabBtn in tabButtons {
            
            if tabBtn.tag == tag {
                tabBtn.isSelected = true
            } else {
                tabBtn.isSelected = false
            }
        }
    }
}
