//
//  TQSettingsCompanyAccProfileCustomizationVC.swift
//  Trular
//
//  Created by Indusnet on 14/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQSettingsCompanyAccProfileCustomizationVC: TQBaseViewController ,UITableViewDataSource,UITableViewDelegate{
    
       var datasource:[[String:String]]!
    
    @IBOutlet weak var saveBtn: UIButton!
    
    @IBAction func saveBtnAction(_ sender: Any) {
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate=self
        
        //        let detailsHeader: [String] = ["ACCOUNT TYPE", "HELP", "TERMS", "APP VERSION", "SPREAD THE WORLD","SEND FEEDBACK","DISCOVER UNKNOWN"]
        //
        //        let detailsData: [String] = ["Client", "Have a questions", "Legal & Privacy Policy", "Quotes 1.0034", "Tell frineds about quotes","Any suggestions","Hidden features & functions"]
        
        
        datasource = [["heading":"BACKGROUND OPACITY","details":"60%"],["heading":"BACKGROUND PICTURE BLUR","details":"40px"],["heading":"BACKGROUND PICTURE  OPACITY","details":"92%"]]
        
        saveBtn.layer.cornerRadius = 2

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackGray"), barTintColor: .clear, itemTintColor: .white,isBarTranslucent: true)
        
        self.setNavigationTitle(title: "Settings", titleColor: .white, subtitle:   "Company Account"+bulletUnicode+"Settings", subtitleColor: .white)
        
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
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0 )
        {
            let cell: TQCAProfileCustomCell2 = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQCAProfileCustomCell2.self)) as! TQCAProfileCustomCell2
            
            
            cell.btnSwitch.isSelected = true
            cell.btnSwitch.setImage(#imageLiteral(resourceName: "green_switch"), for: .selected)
            cell.btnSwitch.setImage(#imageLiteral(resourceName: "switchOff"), for: .normal)
            
            cell.btnSwitch.addTarget(self, action:#selector(self.SwitchbuttonTapped), for: .touchUpInside)
            
            
            return cell
        }else  if (indexPath.row == 1 )
        {
            let cell: TQCAProfileCustomCell3 = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQCAProfileCustomCell3.self)) as! TQCAProfileCustomCell3
            
            cell.headerLbl.text = "BACKGROUND PICTURE"
            cell.dataLbl.text = "Spotify_pic_2017.png"
            
        //    cell.dataSource = datasource[indexPath.row-2] as AnyObject
            
             cell.btnColorPanel.isHidden = true
            
           
            return cell
        }else  if (indexPath.row == 2 )
        {
            let cell: TQCAProfileCustomCell3 = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQCAProfileCustomCell3.self)) as! TQCAProfileCustomCell3
            //    cell.dataSource = datasource[indexPath.row-2] as AnyObject
            
            cell.headerLbl.text = "BACKGROUND COLOR"
            cell.dataLbl.text = "#404041"
            
            cell.btnColorPanel.isHidden = false
            
            return cell
        }else{
            let cell: TQCAProfileCustomCell4 = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQCAProfileCustomCell4.self)) as! TQCAProfileCustomCell4
                cell.dataSource = datasource[indexPath.row-3] as AnyObject
            
            if indexPath.row == 5 {
                cell.separator.isHidden = true
            } else {
                cell.separator.isHidden = false
            }
            
            
            return cell
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0
        {
            return 67
        }
        else if indexPath.row == 1 || indexPath.row == 2
        {
            return 72
        }else if indexPath.row == 5
        {
            return 122
        }else
        {
            return 102
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
