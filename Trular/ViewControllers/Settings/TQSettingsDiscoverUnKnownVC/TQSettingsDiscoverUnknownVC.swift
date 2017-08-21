//
//  TQSettingsDiscoverUnknownVC.swift
//  Trular
//
//  Created by Indusnet on 19/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQSettingsDiscoverUnknownVC: TQBaseViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var tableview: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self
        tableview.delegate=self

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

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0)
        {
            let cell: TQDIscoverUnknowCell1 = self.tableview.dequeueReusableCell(withIdentifier: String(describing: TQDIscoverUnknowCell1.self)) as! TQDIscoverUnknowCell1
            
            cell.btnSwitch.isSelected = true
            cell.btnSwitch.setImage(#imageLiteral(resourceName: "green_switch"), for: .selected)
            cell.btnSwitch.setImage(#imageLiteral(resourceName: "switchOff"), for: .normal)
            
            cell.btnSwitch.addTarget(self, action:#selector(self.SwitchbuttonTapped), for: .touchUpInside)
            
            return cell
        }else if (indexPath.row == 1)
        {
            let cell: TQDIscoverUnknowCell2 = self.tableview.dequeueReusableCell(withIdentifier: String(describing: TQDIscoverUnknowCell2.self)) as! TQDIscoverUnknowCell2
            
            cell.dataLbl.text = "Top title"
            return cell
        }else if (indexPath.row == 2)
        {
             let cell: TQDIscoverUnknowCell3 = self.tableview.dequeueReusableCell(withIdentifier: String(describing: TQDIscoverUnknowCell3.self)) as! TQDIscoverUnknowCell3
            //    cell.dataSource = datasource[indexPath.row-2] as AnyObject
            return cell
        }else if (indexPath.row == 3)
        {
            let cell: TQDIscoverUnknowCell3 = self.tableview.dequeueReusableCell(withIdentifier: String(describing: TQDIscoverUnknowCell3.self)) as! TQDIscoverUnknowCell3
            //    cell.dataSource = datasource[indexPath.row-2] as AnyObject
            
            cell.dataLbl.text="Profile pictures"

            return cell
        }else if (indexPath.row == 4)
        {
            let cell: TQDIscoverUnknowCell4 = self.tableview.dequeueReusableCell(withIdentifier: String(describing: TQDIscoverUnknowCell4.self)) as! TQDIscoverUnknowCell4
            //    cell.dataSource = datasource[indexPath.row-2] as AnyObject
            
            let bullet =  "\u{2022}"
            cell.row1Lbl.text=bullet+" Tap on row info to see full details"
            cell.row2Lbl.text=bullet+" Swipe left/right to see more details"

            
            return cell
        }else if (indexPath.row == 5)
        {
            let cell: TQDIscoverUnknowCell5 = self.tableview.dequeueReusableCell(withIdentifier: String(describing: TQDIscoverUnknowCell5.self)) as! TQDIscoverUnknowCell5
            //    cell.dataSource = datasource[indexPath.row-2] as AnyObject
              let bullet =  "\u{2022}"
             cell.row1Lbl.text=bullet+" Tap and hold to save quote in PDF file"
            
            return cell
        }else if (indexPath.row == 6)
        {
            let cell: TQDIscoverUnknowCell3 = self.tableview.dequeueReusableCell(withIdentifier: String(describing: TQDIscoverUnknowCell3.self)) as! TQDIscoverUnknowCell3
            //    cell.dataSource = datasource[indexPath.row-2] as AnyObject
            
              cell.dataLbl.text="Request a Schedule"
            
            return cell
        }else{
            let cell: TQDIscoverUnknowCell2 = self.tableview.dequeueReusableCell(withIdentifier: String(describing: TQDIscoverUnknowCell2.self)) as! TQDIscoverUnknowCell2
            //    cell.dataSource = datasource[indexPath.row-2] as AnyObject
            
            cell.headerLbl.text="INQUIRES"
            cell.dataLbl.text="Mark as Completed"
            return cell

        }
        
        
        
        
    }
    
    @IBAction func SwitchbuttonTapped(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.3) {
            sender.isSelected = !sender.isSelected
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0
        {
            return 181
        }else if indexPath.row == 1 || indexPath.row==7
        {
            return 72
        }
        else if indexPath.row==2 || indexPath.row==3 || indexPath.row==6
        {
            return 55
        }else  if indexPath.row == 4{
            return 124
        }else{
            
            return 90
        }
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
