//
//  TQNavigationHelper.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 29/05/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import SideMenu

class TQNavigationHelper: NSObject {
    
    static let sharedInstance = TQNavigationHelper()
    
    var loginContainerNavigation: UINavigationController!
    var navigationController: UINavigationController!
    
    var contentMainNavVC: TQContentNavigationVC!
    var mainContainerMainVC: TQContainerVC?
    
    var LeaderboardContentNavVC: UINavigationController!
    
    var SettingsTermsNavVC: UINavigationController!
    var settingsContentNavVC: UINavigationController!
    
    //MARK:- CURRENT VIEW CONTROLLER
    func currentViewController() -> UIViewController {
        return self.contentMainNavVC.viewControllers.last!
    }
    
    //MARK:- PUSH VIEW CONTROLLER
    
    func pushViewController(storyboard:UIStoryboard, viewController:String) {
        
        if viewController != "TQClientRecentController"{
            
            let viewControllerToPush : UIViewController = storyboard.instantiateViewController(withIdentifier: viewController)
            
            let viewControllerClass : AnyClass = NSClassFromString(SWIFT_CLASS_STRING(viewController)!)!
            
            print(TQNavigationHelper.sharedInstance.currentViewController())
            print(TQNavigationHelper.sharedInstance.contentMainNavVC.viewControllers)
            
            if !TQNavigationHelper.sharedInstance.currentViewController().isKind(of: viewControllerClass) {
                
                if TQNavigationHelper.sharedInstance.contentMainNavVC.viewControllers.containsObject(viewControllerClass).isPresent {
                    
                    if String(describing: viewControllerClass) != String(describing: TQDashboardVC.self){
                        TQNavigationHelper.sharedInstance.contentMainNavVC.viewControllers.remove(at: TQNavigationHelper.sharedInstance.contentMainNavVC.viewControllers.containsObject(viewControllerClass).index!)
                    }
                }
                
                if String(describing: viewControllerClass) == String(describing: TQDashboardVC.self) {
                    TQNavigationHelper.sharedInstance.contentMainNavVC.popToRootViewController(animated: true)
                } else {
                    TQNavigationHelper.sharedInstance.contentMainNavVC.pushViewController(viewControllerToPush, animated: true)
                }
            }
        }
    }
    
    func getViewControllerFromStack(_ viewController:String) -> UIViewController? {
        
        let currentStack = TQNavigationHelper.sharedInstance.contentMainNavVC.viewControllers
        let viewControllerClass : AnyClass = NSClassFromString(SWIFT_CLASS_STRING(viewController)!)!

        if currentStack.containsObject(viewControllerClass).isPresent {
            
            guard let idx = currentStack.containsObject(viewControllerClass).index else {
                return nil
            }
            
            return currentStack[idx]
        } else {
            return nil
        }
    }
}
