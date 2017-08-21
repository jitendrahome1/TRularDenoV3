//
//  TQSidePanelVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 31/05/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import SideMenu

class TQSidePanelVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var insideChatCountLabel: UILabel!
    @IBOutlet var insideChatBtn: UIButton!
    
    //For Clients
    var clientSidePanelDatasource : [AnyObject]?
    //For Vendors
    var vendorSidePanelDatasource : [AnyObject]?
    
    var menuArray = [AnyObject]()
    var menuDatasourceArray = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.insideChatCountLabel.layer.cornerRadius = self.insideChatCountLabel.frame.height / 2
        self.insideChatCountLabel.layer.masksToBounds = true
        
        if (TQHelper.sharedInstance.currentUserType == .Client)
        {
//            clientSidePanelDatasource 
        }
        
        self.tableView.estimatedRowHeight = 60
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        if let path = Bundle.main.path(forResource: "TQMenuItems", ofType: "plist") {
            let items: NSArray = NSArray(contentsOfFile: path)!
            for item in items {
                menuArray.append(item as AnyObject)
            }
        }
        
        self.reloadDatasource()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- SideMenu Datasource
    func reloadDatasource() {
        
        menuDatasourceArray.removeAll()
        
        if (TQHelper.sharedInstance.currentUserType == .Vendor)
        {
            self.insideChatBtn.isHidden = false
            self.insideChatCountLabel.isHidden = false
            for item in menuArray {
                
                if (item["isVendor"] as! Bool == true)
                {
                    menuDatasourceArray.append(item as AnyObject)
                }
            }
        }
        else
        {
            self.insideChatBtn.isHidden = true
            self.insideChatCountLabel.isHidden = true
            for item in menuArray {
                
                if (item["isClient"] as! Bool == true)
                {
                    menuDatasourceArray.append(item as AnyObject)
                }
            }
        }
        
        self.tableView.reloadData()
    }
    
    
    //MARK: - TableView Delegate & Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       /* if (TQHelper.sharedInstance.currentUserType == .Client)
        {
            return clientSidePanelDatasource
        }
        else
        {
            return vendorSidePanelDatasource
        }*/
        
        return menuDatasourceArray.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0)
        {
            let userDetailsCell: TQUserDetailsCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQUserDetailsCell.self)) as! TQUserDetailsCell
            
            if TQHelper.sharedInstance.currentUserType == .Vendor {
                userDetailsCell.vendorClientSwitchBtn.setTitle("Vendor", for: .normal)
            } else {
                
                userDetailsCell.vendorClientSwitchBtn.setTitle("Client", for: .normal)
            }
            
            userDetailsCell.switchUser = {
                
                let switchUserActionSheet = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
                
                let clientAction = UIAlertAction.init(title: "Client", style: .default, handler: { (action) in
                    
                    switchUserActionSheet.dismiss(animated: true, completion: nil)
                    TQHelper.sharedInstance.currentUserType = .Client
                    self.reloadDatasource()
                    
                })
                
                let vendorAction = UIAlertAction.init(title: "Vendor", style: .default, handler: { (action) in
                    
                    switchUserActionSheet.dismiss(animated: true, completion: nil)
                    TQHelper.sharedInstance.currentUserType = .Vendor
                    self.reloadDatasource()
                    
                })
                
                let backAction = UIAlertAction.init(title: "Back", style: .cancel, handler: { (action) in
                    
                    switchUserActionSheet.dismiss(animated: true, completion: nil)
                })
                
                clientAction.setValue(UIColor.colorWithHexString("#404041"), forKey: "titleTextColor")
                vendorAction.setValue(UIColor.colorWithHexString("#404041"), forKey: "titleTextColor")
                backAction.setValue(UIColor.colorWithHexString("#A8ACBB"), forKey: "titleTextColor")
                
                switchUserActionSheet.addAction(clientAction)
                switchUserActionSheet.addAction(vendorAction)
                switchUserActionSheet.addAction(backAction)
                
                self.present(switchUserActionSheet, animated: true, completion: nil)
            }
            
            userDetailsCell.showUserProfile = {

                let profileVC = profilePageStoryboard.instantiateViewController(withIdentifier:  String(describing: TQProfilePageVC.self)) as! TQProfilePageVC
                profileVC.type = .user
                TQNavigationHelper.sharedInstance.contentMainNavVC.pushViewController(profileVC, animated: true)
                
                self.dismiss(animated: true, completion: nil)
            }
            
            userDetailsCell.showUserSettings = {
                
                TQNavigationHelper.sharedInstance.pushViewController(storyboard: settingsStoryboard, viewController: String(describing: TQSettingsVC.self))
                self.dismiss(animated: true, completion: nil)
            }
            
            return userDetailsCell
        }
        else
        {
            let menuItemCell: TQMenuItemCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQMenuItemCell.self)) as! TQMenuItemCell
            
            menuItemCell.dataSource = menuDatasourceArray[indexPath.row - 1]
            menuItemCell.didSelect = {
                
                print(self.menuDatasourceArray)
                
                let storyboard:UIStoryboard = UIStoryboard.init(name: self.menuDatasourceArray[indexPath.row - 1]["storyboard"] as! String, bundle: Bundle.main)
                
                TQNavigationHelper.sharedInstance.pushViewController(storyboard: storyboard, viewController: self.menuDatasourceArray[indexPath.row - 1]["class"] as! String)
                self.dismiss(animated: true, completion: nil)
            }
            
            return menuItemCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0
        {
            return UITableViewAutomaticDimension
        }
        else
        {
            return UITableViewAutomaticDimension
        }
    }
    
    @IBAction func insideChatAction(_ sender: UIButton) {
        
        TQNavigationHelper.sharedInstance.pushViewController(storyboard: mainStoryboard, viewController: String(describing: TQUnderConstructionVC.self))
        self.dismiss(animated: true, completion: nil)
    }
}
