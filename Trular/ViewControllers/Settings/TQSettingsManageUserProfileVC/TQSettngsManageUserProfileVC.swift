//
//  TQSettngsManageUserProfileVC.swift
//  Trular
//
//  Created by Indusnet on 14/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQSettngsManageUserProfileVC: TQBaseViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var saveBtn: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func saveBtnAction(_ sender: Any) {
    }
    
    var datasource:[[String:String]]!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate=self
        
        saveBtn.layer.cornerRadius = 2
        
        datasource = [["heading":"E-MAIL","details":"jenny_north@spotify.com","Switch":"NO"],["heading":"PHONE","details":"+48 890 900 901","Switch":"NO"],["heading":"PERMISSION","details":"User","Switch":"NO"],["heading":"REGISTERED","details":"28/04/2017","Switch":"NO"],["heading":"STORAGE","details":"2.07GB","Switch":"NO"],["heading":"LAST LOGGED IN","details":"28/04/2017 * 12:09","Switch":"NO"],["heading":"STATUS","details":"Activated","Switch":"YES"],["heading":"BLOCK USER","details":"BLOCKED","Switch":"YES"]]


        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackGray"), barTintColor: .clear, itemTintColor: .white,isBarTranslucent: true)
        
        self.setNavigationTitle(title: "Settings", titleColor: .white, subtitle:   "Manage users", subtitleColor: .white)
        
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
        
            
            let cell: TQSettingsMUProfileDataCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQSettingsMUProfileDataCell.self)) as! TQSettingsMUProfileDataCell
            
            
            cell.dataSource = datasource[indexPath.row] as AnyObject
        
        cell.btnSwitch.isSelected = true
        
        
        if indexPath.row==7
        {
            cell.btnSwitch.setImage(#imageLiteral(resourceName: "red_switch"), for: .selected)
            cell.btnSwitch.setImage(#imageLiteral(resourceName: "switchOff"), for: .normal)

        }else{
            cell.btnSwitch.setImage(#imageLiteral(resourceName: "green_switch"), for: .selected)
            cell.btnSwitch.setImage(#imageLiteral(resourceName: "switchOff"), for: .normal)

        }

        if indexPath.row == datasource.count - 1 {
            cell.separator.isHidden = true
        } else {
            cell.separator.isHidden = false
        }
        
           cell.btnSwitch.addTarget(self, action:#selector(self.SwitchbuttonTapped), for: .touchUpInside)
        
            return cell
            
       // }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row==7
        {
            return 89
        }else{
            return 67
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
