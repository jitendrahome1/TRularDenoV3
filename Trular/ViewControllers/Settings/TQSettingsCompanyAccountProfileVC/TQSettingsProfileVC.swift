//
//  TQSettingsCompanyAccountProfileVC.swift
//  Trular
//
//  Created by Indusnet on 14/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQSettingsProfileVC: TQBaseViewController ,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var btnEdit: UIButton!
    
     var datasource:[[String:String]]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate=self
        
        if TQHelper.sharedInstance.currentUserType == .Client
        {
              datasource = [["heading":"PHONE","details":"+48 890 900 901"],["heading":"E-MAIL","details":"viggo_svenson@spotify.com"],["heading":"SIGNED QUOTES","details":"1,390"],["heading":"AVERAGE RESPONSE TIME FOR MESSAGE","details":"10 hours"],["heading":"LAST LOGGED IN","details":"28/04/2017 * 20:38"]]
            
        }else if TQHelper.sharedInstance.currentUserType == .Vendor
        {
            datasource = [["heading":"PHONE","details":"+48 890 900 901"],["heading":"E-MAIL","details":"viggo_svenson@spotify.com"],["heading":"SIGNED QUOTES","details":"1,390"],["heading":"AVERAGE RESPONSE TIME FOR MESSAGE","details":"10 hours"],["heading":"LAST LOGGED IN","details":"28/04/2017 * 20:38"]]
            
        }else{
             datasource = [["heading":"PHONE","details":"+48 890 900 901"],["heading":"E-MAIL","details":"inquiries@spotify.com"],["heading":"SIGNED QUOTES","details":"3,999"],["heading":"AVERAGE RESPONSE TIME FOR MESSAGE","details":"10 hours"],["heading":"LAST LOGGED IN","details":"28/04/2017 * 20:38"]]
        }
        
        
        
        
        
        if TQHelper.sharedInstance.currentUserType == .Client
        {
        
            
        }else if TQHelper.sharedInstance.currentUserType == .Vendor
        {
            
        
        }else
        {
            
        
        }
        
       
                  
                    
        self.btnEdit.addTarget(self, action:#selector(self.EditbuttonTapped), for: .touchUpInside)

    
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackGray"), barTintColor: .clear, itemTintColor: .white,isBarTranslucent: true)
        
        self.setNavigationTitle(title: "Settings", titleColor: .white, subtitle:   "Company Account"+bulletUnicode+"Profile Page", subtitleColor: .white)
        
        if TQHelper.sharedInstance.currentUserType == .VendorAdmin || TQHelper.sharedInstance.currentUserType == .ClientAdmin {
            
            self.setRightBarButtonText(text: "Admin", textColor: .white, backgroundColor: .clear, showBorder: true, borderColor: .colorWithHexString("#f2f3f5"))
        }
        
        
        self.extendedLayoutIncludesOpaqueBars = true
        self.edgesForExtendedLayout = .top
        self.hideNavigationBar = false
        self.showSidePanel = false
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell: TSettingsProfileDataCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TSettingsProfileDataCell.self)) as! TSettingsProfileDataCell
            
            
            cell.dataSource = datasource[indexPath.row] as AnyObject
        
            return cell
            
      //  }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        

            return 79
  
        
        
    }
    func EditbuttonTapped(sender : UIButton){
        
        if TQHelper.sharedInstance.currentUserType == .Client
        {
           
            
        }else if TQHelper.sharedInstance.currentUserType == .Vendor
        {
           
            
        }else
        {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsCompanyAccProfileCustomizationVC") as! TQSettingsCompanyAccProfileCustomizationVC
        self.navigationController?.pushViewController(controller, animated: true)
            
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
