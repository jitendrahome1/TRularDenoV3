//
//  TQSettingsClientAdminCompanyAccVC.swift
//  Trular
//
//  Created by Indusnet on 09/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQSettingsCompanyAccountVC: TQBaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let dataSource: [String] = ["Settings", "Manage users", "Notifications"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate=self
        
        tableView.tableFooterView = UIView()
        
        self.tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.size.width, height: 1))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackGray"), barTintColor: .white, itemTintColor: .lightGray,isBarTranslucent: false)
        
        self.setNavigationTitle(title: "Settings", titleColor: .colorWithHexString("#404041"), subtitle: "", subtitleColor: .white)
        
        if TQHelper.sharedInstance.currentUserType == .VendorAdmin || TQHelper.sharedInstance.currentUserType == .ClientAdmin {
            
            self.setRightBarButtonText(text: "Admin", textColor: .colorWithHexString("#666666"), backgroundColor: .colorWithHexString("#f2f3f5"), showBorder: false, borderColor: .colorWithHexString("#f2f3f5"))
        }
        
        self.hideNavigationBar = false
        self.showSidePanel = false
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return 4
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0)
        {
            let cell: TQCompanyAccCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQCompanyAccCell.self)) as! TQCompanyAccCell
            
            
            
                     
            
            return cell
        }else
        {
            let cell: TQCompanyAccDetailsCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQCompanyAccDetailsCell.self)) as! TQCompanyAccDetailsCell
            
            
     
            
              cell.dataSource = dataSource[indexPath.row-1] as AnyObject
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0
        {
            return 80
        }else
        {
            return 54
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if indexPath.row==1 {
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsEditCompanyAccountVC") as! TQSettingsEditCompanyAccountVC
            self.navigationController?.pushViewController(controller, animated: true)
            
            
        }else if indexPath.row==2
        {
            
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsManageUsersVC") as! TQSettingsManageUsersVC
            self.navigationController?.pushViewController(controller, animated: true)
            
        }else if indexPath.row==3
        {
            
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsNotificationVC") as! TQSettingsNotificationVC
            self.navigationController?.pushViewController(controller, animated: true)
            
        }else if indexPath.row==0
        {
            
            let settingsProfileVC = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsProfileVC") as! TQSettingsProfileVC
            self.navigationController?.pushViewController(settingsProfileVC, animated: true)
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
