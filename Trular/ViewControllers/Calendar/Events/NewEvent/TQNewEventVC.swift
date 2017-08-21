//
//  TQNewEventVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 18/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQNewEventVC: TQBaseTableViewController,UITextViewDelegate {

    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet var inviteUserbtn: UIButton!
    @IBOutlet var selectedQuoteStatusBtn: UIButton!
    
    @IBOutlet var timeFromLbl: UILabel!
    @IBOutlet var timeToLbl: UILabel!
    @IBOutlet var currentDateLbl: UILabel!
    
    @IBOutlet var datePickerImgVw: UIImageView!
    
    
    var didPickLocation = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let backgroundVw = UIView.init()
        backgroundVw.backgroundColor = UIColor.colorWithHexString("#91c569")
        self.tableView.backgroundView = backgroundVw
        
        self.tableView.estimatedRowHeight = 71
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        if !didPickLocation {
            self.locationLbl.text = "Add location"
        }
        
        self.selectedQuoteStatusBtn.layer.cornerRadius = 2
        
        self.datePickerImgVw.image = #imageLiteral(resourceName: "calendar").withRenderingMode(.alwaysTemplate)
        self.datePickerImgVw.tintColor = .white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // Do any additional setup after loading the view.
        
        self.showSidePanel = false
        self.hideNavigationBar = false
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackWhite"), barTintColor: .colorWithHexString("#91c569"), itemTintColor: .white,isBarTranslucent: false)
        
        self.setNavigationTitle(title: "Calendar", titleColor: .white, subtitle: "Company"+bulletUnicode+"Stockholm", subtitleColor: .white)
        
        self.setNotificationBtn(notificationCount: 0)
    }

    //MARK:- TableView Delegate & Datasource
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 2:
                return UITableViewAutomaticDimension
            case 6:
                return 105
            case 7:
                return UITableViewAutomaticDimension
            case 8:
                return 105
                
            default:
                return 71
            }
            
        case 1:
            switch indexPath.row {
            case 2:
                return 77
            default:
                return 73
            }
        
        default:
            return 71
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            
            switch indexPath.row {
            case 1:
                
                let eventTypeVC : TQEventTypeVC = quotesStoryboard.instantiateViewController(withIdentifier: String(describing: TQEventTypeVC.self)) as! TQEventTypeVC
                
                eventTypeVC.selectedEvent = { (eventType) in
                    
                    self.tableView.reloadData()
                }
                
                TQNavigationHelper.sharedInstance.contentMainNavVC.pushViewController(eventTypeVC, animated: true)
            case 5:
                let selectLocationVC : TQSelectLocationVC = quotesStoryboard.instantiateViewController(withIdentifier: String(describing: TQSelectLocationVC.self)) as! TQSelectLocationVC
                
                selectLocationVC.selectedLocation = { (location, locationString) in
                    
                    if locationString.characters.count > 0 {
                        self.locationLbl.text = locationString
                    } else {
                        self.locationLbl.text = "\(location)"
                    }
                    
                    self.tableView.reloadData()
                }
                
                TQNavigationHelper.sharedInstance.contentMainNavVC.pushViewController(selectLocationVC, animated: true)
            case 6:
                TQNavigationHelper.sharedInstance.pushViewController(storyboard: quotesStoryboard, viewController: String(describing: TQSelectQuoteVC.self))
            case 8:
                TQNavigationHelper.sharedInstance.pushViewController(storyboard: quotesStoryboard, viewController: String(describing: TQSelectOwnerVC.self))
                
            default:
                break
            }
            
        default:
            break
        }
    }
    
    //MARK:- Button Actions
    
    @IBAction func selectDateAction(_ sender: UIButton) {
        
        let cell = self.tableView.cellForRow(at: IndexPath(row: 3, section: 0))
        let imgVw = cell!.viewWithTag(355)! as! UIImageView
        
        UIGraphicsBeginImageContextWithOptions(imgVw.bounds.size, false, UIScreen.main.scale)
        imgVw.layer.render(in: UIGraphicsGetCurrentContext()!)
        
        var downloadCellViewCenter = imgVw.convert((imgVw.center), to: UIApplication.shared.keyWindow)
        downloadCellViewCenter.y -= imgVw.frame.origin.y
        
        TQDatePickerVC.showPickerController(self, isDatePicker: true, preSelected: "", highlightedImg:UIGraphicsGetImageFromCurrentImageContext()!, position: downloadCellViewCenter) { (value) in
            
            print(value!)
            
            self.currentDateLbl.text = "\(value!)"
            self.tableView.reloadData()
        }
    }
    
    @IBAction func selectTimeFromAction(_ sender: UIButton) {
        
        let cell = self.tableView.cellForRow(at: IndexPath(row: 4, section: 0))
        let lbl = cell!.viewWithTag(455)! as! UILabel
        
        UIGraphicsBeginImageContextWithOptions(lbl.bounds.size, false, UIScreen.main.scale)
        lbl.layer.render(in: UIGraphicsGetCurrentContext()!)
        
        var downloadCellViewCenter = lbl.convert((lbl.center), to: UIApplication.shared.keyWindow)
        downloadCellViewCenter.y -= lbl.frame.origin.y
        
        TQDatePickerVC.showPickerController(self, isDatePicker: false, preSelected: "", highlightedImg: UIGraphicsGetImageFromCurrentImageContext()!, position: downloadCellViewCenter) { (value) in
            
            print(value!)
            
            lbl.text = "\(value!)"
            self.tableView.reloadData()
        }
    }
    
    @IBAction func selectTimeToAction(_ sender: UIButton) {
        
        let cell = self.tableView.cellForRow(at: IndexPath(row: 4, section: 0))
        let lbl = cell!.viewWithTag(456)! as! UILabel
        
        UIGraphicsBeginImageContextWithOptions(lbl.bounds.size, false, UIScreen.main.scale)
        lbl.layer.render(in: UIGraphicsGetCurrentContext()!)
        
        var downloadCellViewCenter = lbl.convert((lbl.center), to: UIApplication.shared.keyWindow)
        downloadCellViewCenter.y -= lbl.frame.origin.y
        
        TQDatePickerVC.showPickerController(self, isDatePicker: false, preSelected: "", highlightedImg: UIGraphicsGetImageFromCurrentImageContext()!, position: downloadCellViewCenter) { (value) in
            
            print(value!)
            
            lbl.text = "\(value!)"
            self.tableView.reloadData()
        }
    }
    
    @IBAction func selectTimezoneAction(_ sender: UIButton) {
        
        TQNavigationHelper.sharedInstance.pushViewController(storyboard: quotesStoryboard, viewController: String(describing: TQSelectTimezoneVC.self))
    }
    
    @IBAction func addReminderAction(_ sender: UIButton) {
        
        TQNavigationHelper.sharedInstance.pushViewController(storyboard: quotesStoryboard, viewController: String(describing: TQAddReminderVC.self))
    }
    
    @IBAction func addMoreUsersAction(_ sender: UIButton) {
        
        TQNavigationHelper.sharedInstance.pushViewController(storyboard: quotesStoryboard, viewController: String(describing: TQInviteUsersVC.self))
    }
    
    @IBAction func createEventAction(_ sender: UIButton) {
        TQNavigationHelper.sharedInstance.contentMainNavVC.popViewController(animated: true)
    }
    
    // MARK:- UITextViewDelegate
    func textViewDidChange(_ textView: UITextView) {
        
        let currentOffset = tableView.contentOffset
        UIView.setAnimationsEnabled(false)
        tableView.beginUpdates()
        tableView.endUpdates()
        UIView.setAnimationsEnabled(true)
        tableView.setContentOffset(currentOffset, animated: false)
    }
}
