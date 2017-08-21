//
//  TQSignUpContainerVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 29/05/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQSignUpContainerVC: UIViewController {
    
    /*** This Container is being used only for registration and login***/
    
    @IBOutlet var btnClient: UIButton!
    @IBOutlet var barClient: UILabel!
    
    @IBOutlet var barVendor: UILabel!
    @IBOutlet var btnVendor: UIButton!
    
    //Checking if user is logging in or registering
    var didPressLogin:Bool! {
        
        didSet {
            
            TQHelper.sharedInstance.didPressLogin = didPressLogin
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //Default setup
        btnClient.isSelected = true
        btnVendor.isSelected = false
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnClientAction(_ sender: UIButton) {
        
        if !sender.isSelected
        {
            sender.isSelected = true
            barClient.backgroundColor = .white
            barClient.alpha = 0.0

            btnVendor.isSelected = false
            barVendor.backgroundColor = UIColor.init(colorLiteralRed: 51.0/255.0, green: 162.0/255.0, blue: 255.0/255.0, alpha: 0.0)
            
            UIView.animate(withDuration: 0.3, animations: {
                
                sender.isSelected = true
                self.btnVendor.isSelected = false

                self.barClient.alpha = 1.0
                self.barVendor.backgroundColor = UIColor.init(colorLiteralRed: 51.0/255.0, green: 162.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            })
            
            //Checking whether user is registering or logging in
            
            if (TQHelper.sharedInstance.didPressLogin)
            {
                //Pushing to LoginOptionVC where client can login as company or user
                let clientLoginOption = mainStoryboard.instantiateViewController(withIdentifier: String(describing: TQLoginOptionVC.self)) as! TQLoginOptionVC
                TQHelper.sharedInstance.loginInfoDict?[USER_TYPE] = UserType.Client as AnyObject
                TQNavigationHelper.sharedInstance.loginContainerNavigation.setViewControllers([clientLoginOption], animated: false)
            }
            else
            {
                //Pushing to ClientRegistrationOptionVC where client can register as company or individual
                let clientRegistrationOption = mainStoryboard.instantiateViewController(withIdentifier: String(describing: TQClientRegistrationOptionVC.self)) as! TQClientRegistrationOptionVC
                TQHelper.sharedInstance.registrationInfoDict?[USER_TYPE] = UserType.Client as AnyObject

                TQNavigationHelper.sharedInstance.loginContainerNavigation.setViewControllers([clientRegistrationOption], animated: false)
            }
        }
    }
    
    @IBAction func btnVendorAction(_ sender: UIButton) {
        
        if !sender.isSelected
        {
            barVendor.backgroundColor = .white
            barVendor.alpha = 0.0
            
            btnClient.isSelected = false
            barClient.backgroundColor = UIColor.init(colorLiteralRed: 51.0/255.0, green: 162.0/255.0, blue: 255.0/255.0, alpha: 0.0)
            
            UIView.animate(withDuration: 0.3, animations: {
                
                sender.isSelected = true
                self.btnClient.isSelected = false

                self.barVendor.alpha = 1.0
                self.barClient.backgroundColor = UIColor.init(colorLiteralRed: 51.0/255.0, green: 162.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            })
            
            //Checking whether user is registering or logging in
            if (TQHelper.sharedInstance.didPressLogin)
            {
                //Pushing to TQLogin_CompanyVC where vendor can login
                let loginCompany = mainStoryboard.instantiateViewController(withIdentifier: String(describing: TQLogin_CompanyVC.self)) as! TQLogin_CompanyVC
                
                TQHelper.sharedInstance.loginInfoDict?[USER_TYPE] = UserType.Vendor as AnyObject
                TQHelper.sharedInstance.currentUserType = .Vendor
                TQHelper.sharedInstance.loginInfoDict?[CLIENT_TYPE] = ClientType.Company as AnyObject

                TQNavigationHelper.sharedInstance.loginContainerNavigation.setViewControllers([loginCompany], animated: false)
            }
            else
            {
                //Pushing to TQRegistration_CompanyNameVC where vendor can register as company
                let registration_Company = mainStoryboard.instantiateViewController(withIdentifier: String(describing: TQRegistration_CompanyNameVC.self)) as! TQRegistration_CompanyNameVC
                TQHelper.sharedInstance.registrationInfoDict?[USER_TYPE] = UserType.Vendor as AnyObject
                TQHelper.sharedInstance.currentUserType = .Vendor
                TQHelper.sharedInstance.registrationInfoDict?[CLIENT_TYPE] = ClientType.Company as AnyObject

                TQNavigationHelper.sharedInstance.loginContainerNavigation.setViewControllers([registration_Company], animated: false)
            }
        }
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        
        //Since a content navigation controller was used to push the registration and login due to the design, first check whether contentNav stack contains any vcs. If it does then pop those first else pop from the main navigation controller.
        if TQNavigationHelper.sharedInstance.loginContainerNavigation.viewControllers.count == 1
        {
            self.navigationController?.popViewController(animated: true)
        }
        else
        {
            TQNavigationHelper.sharedInstance.loginContainerNavigation.popViewController(animated: true)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ContentNavigationControllerEmbedSegue"
        {
            TQNavigationHelper.sharedInstance.loginContainerNavigation = segue.destination as! UINavigationController
            
            if (TQHelper.sharedInstance.didPressLogin)
            {
                let clientLoginOption = mainStoryboard.instantiateViewController(withIdentifier: String(describing: TQLoginOptionVC.self)) as! TQLoginOptionVC
                
                TQHelper.sharedInstance.loginInfoDict?[USER_TYPE] = UserType.Client as AnyObject
                TQHelper.sharedInstance.currentUserType = .Client
                TQNavigationHelper.sharedInstance.loginContainerNavigation.setViewControllers([clientLoginOption], animated: false)
            }
            else
            {
                let clientRegistrationOption = mainStoryboard.instantiateViewController(withIdentifier: String(describing: TQClientRegistrationOptionVC.self)) as! TQClientRegistrationOptionVC
                TQHelper.sharedInstance.registrationInfoDict?[USER_TYPE] = UserType.Client as AnyObject
                TQHelper.sharedInstance.currentUserType = .Client
                TQNavigationHelper.sharedInstance.loginContainerNavigation.setViewControllers([clientRegistrationOption], animated: false)
            }
        }
    }
}
