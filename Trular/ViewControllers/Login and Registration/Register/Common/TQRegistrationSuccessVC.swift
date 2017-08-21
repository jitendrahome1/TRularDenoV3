//
//  TQRegistrationSuccessVCTableViewController.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 29/05/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQRegistrationSuccessVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.tableView.estimatedRowHeight = 57;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.navigationController?.isNavigationBarHidden = true
        
        self.tableView.backgroundColor = .colorWithHexString("#92C569")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let cellHeight = SCREEN_HEIGHT/7
        
        switch indexPath.row
        {
        case 0:
            return cellHeight
        case 1:
            return IS_IPAD() ? 267 : cellHeight * 2
        case 2:
            return UITableViewAutomaticDimension
        case 3:
            return IS_IPAD() ? 100 : 85
        case 4:
            return UITableViewAutomaticDimension
        case 5:
            return IS_IPAD() ? cellHeight : cellHeight / 3
        case 6:
            return cellHeight
        default:
            return cellHeight
        }
    }
    
    //MARK: - Button Actions
    @IBAction func login(_ sender: Any) {
        
        let containerVC = mainStoryboard.instantiateViewController(withIdentifier: String(describing: TQSignUpContainerVC.self)) as! TQSignUpContainerVC
        containerVC.didPressLogin = true
        TQNavigationHelper.sharedInstance.navigationController.pushViewController(containerVC, animated: true)
    }
}
