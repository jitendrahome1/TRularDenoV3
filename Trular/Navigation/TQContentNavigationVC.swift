//
//  TQContentNavigationVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 21/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import SideMenu

class TQContentNavigationVC: UINavigationController,UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        //TQNavigationHelper.sharedInstance.contentMainNavVC  = self
        
        // Do any additional setup after loading the view.
        self.isNavigationBarHidden = true
        self.setSidePanel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Intialize Side Panel
    func setSidePanel() {
        
        let menuLeftNavigationController = mainStoryboard.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as! UISideMenuNavigationController
        
        SideMenuManager.menuLeftNavigationController = menuLeftNavigationController
        
        SideMenuManager.menuAddPanGestureToPresent(toViewController: self)
        SideMenuManager.menuLeftSwipeToDismissGesture?.isEnabled = true
        SideMenuManager.menuPushStyle = .popWhenPossible
        SideMenuManager.menuPresentMode = .viewSlideInOut
        SideMenuManager.menuAllowPushOfSameClassTwice = false
        SideMenuManager.menuWidth = SCREEN_WIDTH * 0.85
        SideMenuManager.menuAnimationPresentDuration = 0.30
        SideMenuManager.menuAnimationDismissDuration = 0.30
        SideMenuManager.menuAnimationFadeStrength = 0.5
        
        SideMenuManager.menuParallaxStrength = 0
        SideMenuManager.menuFadeStatusBar = false
        SideMenuManager.menuAnimationOptions = .curveEaseInOut
        //        SideMenuManager.menuAddScreenEdgePanGesturesToPresent(toView: self.view)
    }
    
    //MARK:- Gesture Recognizer Delegates
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool
    {
        return TQHelper.sharedInstance.showSidePanel
    }
}
