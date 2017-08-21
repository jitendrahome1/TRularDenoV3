//
//  TQSettingsCACompanyAccNotificationSettingsVC.swift
//  Trular
//
//  Created by Indusnet on 09/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQSettingsNotificationVC: TQBaseViewController ,UITableViewDataSource,UITableViewDelegate {

    
    @IBAction func saveBtnAction(_ sender: Any) {
             
        
    }
    
    
    @IBOutlet weak var saveBtn: UIButton!
    
        var dataSource: [String]!
    
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource = self
        tableView.delegate=self
        
        saveBtn.layer.cornerRadius = 2
        
        
      if TQHelper.sharedInstance.currentUserType == .VendorAdmin {
             dataSource = ["Calender reminder", "Quotes signed", "New signature", "Invitation Confirmed", "Finished signing","Confirmed as finished","Sign the quote","New inquiry","Inquiry sent","New quote","Open quote"]
      }else  if TQHelper.sharedInstance.currentUserType == .Vendor {
        dataSource = ["Calender reminder", "Quotes signed", "New signature", "Invitation Confirmed", "Finished signing","Confirmed as finished","Sign the quote","New inquiry","Inquiry sent","New quote","Open quote"]
      }else{
        
            dataSource = ["Calender reminder", "Quotes signed", "New signature", "Invitation Confirmed", "Finished signing","New quote","Inquiry sent","Confirm as finished"]
        }

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackGray"), barTintColor: .white, itemTintColor: .lightGray,isBarTranslucent: false)
        
        self.setNavigationTitle(title: "Settings", titleColor: .colorWithHexString("#404041"), subtitle:   "Company Account"+bulletUnicode+"Notifications", subtitleColor: .colorWithHexString("#404041"))
        
        if TQHelper.sharedInstance.currentUserType == .VendorAdmin || TQHelper.sharedInstance.currentUserType == .ClientAdmin {
            
            self.setRightBarButtonText(text: "Admin", textColor: .colorWithHexString("#666666"), backgroundColor: .colorWithHexString("#f2f3f5"), showBorder: false, borderColor: .colorWithHexString("#f2f3f5"))
        }
        
        
        //        self.extendedLayoutIncludesOpaqueBars = true
        //        self.edgesForExtendedLayout = .top
        self.hideNavigationBar = false
        self.showSidePanel = false
    }
    
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return dataSource.count+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row==0 {
            let cell: TQNotificationHeaderCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQNotificationHeaderCell.self)) as! TQNotificationHeaderCell
            
            
            
            return cell
            
        } else
        {
            
            
            let cell: TQNotificationDataCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQNotificationDataCell.self)) as! TQNotificationDataCell
            
          cell.dataSource=dataSource[indexPath.row-1] as AnyObject
            
            
            cell.btnSwitch.isSelected = true
            cell.btnSwitch.setImage(#imageLiteral(resourceName: "green_switch"), for: .selected)
            cell.btnSwitch.setImage(#imageLiteral(resourceName: "switchOff"), for: .normal)
            
            cell.btnSwitch.addTarget(self, action:#selector(self.SwitchbuttonTapped), for: .touchUpInside)
            
            if indexPath.row == dataSource.count {
                cell.separator.isHidden = true
            } else {
                cell.separator.isHidden = false
            }
            
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row==0 {
            
            return 80
        }else if indexPath.row==8 {
            
            return 62
        }else{
            
            return 62
        }
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        
        
    }
    @IBAction func SwitchbuttonTapped(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.3) {
            sender.isSelected = !sender.isSelected
        }
    }
    

    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
