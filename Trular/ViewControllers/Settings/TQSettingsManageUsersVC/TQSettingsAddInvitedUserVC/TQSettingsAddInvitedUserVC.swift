//
//  TQSettingsAddInvitedUserVC.swift
//  Trular
//
//  Created by Indusnet on 14/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQSettingsAddInvitedUserVC: TQBaseViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
   
     var datasource:[[String:String]]!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate=self
        
        datasource = [["heading":"NAME","details":"Jennifer North"],["heading":"E-MAIL","details":"jenny_north@vans.com"],["heading":"PHONE","details":"+48 890 900 901"],["heading":"BRANCH","details":"Stockholm"],["heading":"PERMISSION","details":"Administrator"]]
        
        saveBtn.backgroundColor = .clear
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackWhite"), barTintColor: .colorWithHexString("#008BFF"), itemTintColor: .white,isBarTranslucent: false)
        
        self.setNavigationTitle(title: "Settings", titleColor: .white, subtitle:"Stockholm", subtitleColor: .white)
        
        if TQHelper.sharedInstance.currentUserType == .VendorAdmin || TQHelper.sharedInstance.currentUserType == .ClientAdmin {
            
            self.setRightBarButtonText(text: "Admin", textColor: .white, backgroundColor: .clear, showBorder: true, borderColor: .colorWithHexString("#f2f3f5"))
        }
        
        self.hideNavigationBar = false
        self.showSidePanel = false
    }

    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TQAddInvitedUserDataCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQAddInvitedUserDataCell.self)) as! TQAddInvitedUserDataCell
        
        cell.dataSource = datasource[indexPath.row] as AnyObject
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
      
    }
    
    @IBAction func sendAction(_ sender: UIButton) {
        
        TQNavigationHelper.sharedInstance.contentMainNavVC.popViewController(animated: true)
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
