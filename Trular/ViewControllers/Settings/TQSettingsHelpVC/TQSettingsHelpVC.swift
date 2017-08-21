//
//  TQSettingsHelpVC.swift
//  Trular
//
//  Created by Indusnet on 14/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQSettingsHelpVC: TQBaseViewController ,UITableViewDataSource,UITableViewDelegate{

    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate=self

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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0)
        {
            let cell: TQSettingsHelpHeaderCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQSettingsHelpHeaderCell.self)) as! TQSettingsHelpHeaderCell
            
            return cell
        }else if (indexPath.row == 1)
        {
            let cell: TQSettingsHelpDataCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQSettingsHelpDataCell.self)) as! TQSettingsHelpDataCell
            
            
            return cell
        }else if (indexPath.row == 2)
        {
            let cell: TQSettingsHelpDataCell1 = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQSettingsHelpDataCell1.self)) as! TQSettingsHelpDataCell1
            cell.QuestionLbl.text="Question #2"
            
            
        //    cell.dataSource = datasource[indexPath.row-2] as AnyObject
            return cell
        }else if (indexPath.row == 3)
        {
            let cell: TQSettingsHelpDataCell1 = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQSettingsHelpDataCell1.self)) as! TQSettingsHelpDataCell1
            cell.QuestionLbl.text="Question #3"
            
            //    cell.dataSource = datasource[indexPath.row-2] as AnyObject
            return cell
        }else
        {
            let cell: TQSettingsHelpDataCell2 = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQSettingsHelpDataCell2.self)) as! TQSettingsHelpDataCell2
            
            
            //    cell.dataSource = datasource[indexPath.row-2] as AnyObject
            return cell
        }
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0
        {
            return 80
        }else if indexPath.row == 1
        {
            return 78
        }
        else if indexPath.row==4
        {
            return 263
        }else{
            return 67
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
