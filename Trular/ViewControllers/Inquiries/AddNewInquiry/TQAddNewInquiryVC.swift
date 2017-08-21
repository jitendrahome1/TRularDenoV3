//
//  TQAddNewInquiryVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 16/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQAddNewInquiryVC: TQBaseTableViewController,UITextViewDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 76.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackWhite"), barTintColor: .colorWithHexString("#008BFF"), itemTintColor: .white,isBarTranslucent: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            
            TQNavigationHelper.sharedInstance.pushViewController(storyboard: inquiriesStoryboard, viewController: String(describing: TQInquiriesSettingsVC.self))
           
        default:
            break
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 90
        case 1:
            return 61
        case 6:
            return UITableViewAutomaticDimension
        case 11:
            return 75
        case 12:
            return 77
            
        default:
            return 76
        }
    }
    
    //MARK:- Button Actions
    
    @IBAction func actionAddAttachments(_ sender: UIButton) {
        
        TQNavigationHelper.sharedInstance.pushViewController(storyboard: inquiriesStoryboard, viewController: String(describing: TQInquiriesAddAttachment.self))
    }
    @IBAction func actionSendInquiry(_ sender: UIButton) {
        
        TQNavigationHelper.sharedInstance.pushViewController(storyboard: inquiriesStoryboard, viewController: String(describing: TQViewInquiryVC.self))
    }
    
    // MARK: UITextViewDelegate
    func textViewDidChange(_ textView: UITextView) {
        
        let currentOffset = tableView.contentOffset
        UIView.setAnimationsEnabled(false)
        tableView.beginUpdates()
        tableView.endUpdates()
        UIView.setAnimationsEnabled(true)
        tableView.setContentOffset(currentOffset, animated: false)
    }
}
