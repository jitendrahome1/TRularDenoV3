//
//  TQSettingsClientAdminUserMyAccount.swift
//  Trular
//
//  Created by Indusnet on 08/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQSettingsClientAccountVC: TQBaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tableview: UITableView!
    
     var datasource:[[String:String]]!
    
    @IBOutlet weak var saveBtn: UIButton!
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        tableview.dataSource = self
        tableview.delegate = self
        
        saveBtn.layer.cornerRadius = 2
        
       /*if TQHelper.sharedInstance.currentUserType == .Client
       {
        datasource = [["heading":"NAME","details":"Viggo Svenson"],["heading":"E-MAIL","details":"viggo_svenson@spotify.com"],["heading":"PHONE","details":"+48 930 900 901"],["heading":"PASSWORD","details":"***********"],["heading":"CURRENCY","details":"USD"],["heading":"LANGUAGE","details":"ENGLISH"],["heading":"TIMEZONE","details":"CEST UTC/GMT +2 hours"]]
        
        }else
       {*/
          datasource = [["heading":"NAME","details":"Viggo Svenson"],["heading":"E-MAIL","details":"viggo_svenson@spotify.com"],["heading":"PHONE","details":"+48 930 900 901"],["heading":"PASSWORD","details":"***********"],["heading":"COMPANY","details":"Spotify Inc"],["heading":"CURRENCY","details":"USD"],["heading":"LANGUAGE","details":"ENGLISH"],["heading":"TIMEZONE","details":"CEST UTC/GMT +2 hours"]]
//        }
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
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0)
        {
            let cell: TQClientAccHeaderCell = self.tableview.dequeueReusableCell(withIdentifier: String(describing: TQClientAccHeaderCell.self)) as! TQClientAccHeaderCell
            
              return cell
        } else if (indexPath.row == datasource.count - 1) {
            let cell: UITableViewCell = self.tableview.dequeueReusableCell(withIdentifier: "notificationsCell")!
            
            let btn = cell.viewWithTag(1622) as! UIButton
            btn.addTarget(self, action:#selector(self.NotificationbuttonTapped), for: .touchUpInside)
 
            return cell
        }
        else
        {
            let cell: TQClientAccInfoCell = self.tableview.dequeueReusableCell(withIdentifier: String(describing: TQClientAccInfoCell.self)) as! TQClientAccInfoCell
            
             cell.dataSource = datasource[indexPath.row-1] as AnyObject
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if TQHelper.sharedInstance.currentUserType == .Client
        {
            if indexPath.row == 0
            {
                return 80
            }else if indexPath.row == datasource.count - 1
            {
                return 62
            }else{
                return 79
            }

            
        }else{
        
        
        if indexPath.row == 0
        {
            return 80
        }else if indexPath.row == datasource.count - 1
        {
            return 62
            
        }else{
            return 79
        }
            
            
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //client_user
        
                  let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsProfileVC") as! TQSettingsProfileVC
            self.navigationController?.pushViewController(controller, animated: true)
            
       

        
    }
    func NotificationbuttonTapped(sender : UIButton){
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsNotificationVC") as! TQSettingsNotificationVC
        self.navigationController?.pushViewController(controller, animated: true)
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
