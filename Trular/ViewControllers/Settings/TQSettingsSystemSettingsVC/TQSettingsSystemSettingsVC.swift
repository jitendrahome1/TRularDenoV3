//
//  TQSettingsSystemSettingsVC.swift
//  Trular
//
//  Created by Indusnet on 15/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQSettingsSystemSettingsVC: TQBaseViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func saveBtnAction(_ sender: Any) {
    }
    
    @IBOutlet weak var saveBtn: UIButton!
     var datasource1:[[String:String]]!
     var datasource2:[[String:String]]!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.dataSource = self
        tableView.delegate=self
        
        //        let detailsHeader: [String] = ["ACCOUNT TYPE", "HELP", "TERMS", "APP VERSION", "SPREAD THE WORLD","SEND FEEDBACK","DISCOVER UNKNOWN"]
        //
        //        let detailsData: [String] = ["Client", "Have a questions", "Legal & Privacy Policy", "Quotes 1.0034", "Tell frineds about quotes","Any suggestions","Hidden features & functions"]
        
        
        datasource1 = [["heading":"DATE FORMAT","details":"DD/MM/RRRR"],["heading":"FIRST ID NUMBER","details":"2017"],["heading":"CURRENCY","details":"USD"],["heading":"WORK WEEK","details":"Monday-Friday"]]
        
         datasource2 = [["heading":"LANGUAGE","details":"English"],["heading":"TIMEZONE ","details":"CEST UTC/GMT +2 hours"]]
        
        saveBtn.layer.cornerRadius = 2

        // Do any additional setup after loading the view.
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
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        if (indexPath.row == 0)
        {
            let cell: TQSystemSettingsCell1 = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQSystemSettingsCell1.self)) as! TQSystemSettingsCell1
            
            return cell
        }else if (indexPath.row == 5)
        {
            let cell: TQSystemSettingsCell4 = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQSystemSettingsCell4.self)) as! TQSystemSettingsCell4
            
            
            return cell
        }else if (indexPath.row == 8)
        {
            let cell: TQSystemSettingsCell3 = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQSystemSettingsCell3.self)) as! TQSystemSettingsCell3
            
            
            // cell.dataSource = datasource[indexPath.row-2] as AnyObject
            return cell
        }else if indexPath.row==6 || indexPath.row==7
        {
            let cell: TQSystemSettingsCell2 = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQSystemSettingsCell2.self)) as! TQSystemSettingsCell2
            
            
             cell.dataSource = datasource2[indexPath.row-6] as AnyObject
            return cell
        }else{
            
            let cell: TQSystemSettingsCell2 = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQSystemSettingsCell2.self)) as! TQSystemSettingsCell2
            
            cell.dataSource = datasource1[indexPath.row-1] as AnyObject
          
            
            
            
            return cell

            
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0
        {
            return 80
        }else if indexPath.row == 1
        {
            return 72
        }
        else if indexPath.row == 8
        {
            return 136
        }else{
            return 76
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        
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
