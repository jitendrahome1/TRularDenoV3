//
//  TQSettingsClientCompanyAccSettingsVC.swift
//  Trular
//
//  Created by Indusnet on 09/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQSettingsEditCompanyAccountVC: TQBaseViewController,UITableViewDataSource,UITableViewDelegate {
    
      var datasource:[[String:String]]!

    @IBOutlet weak var saveBtn: UIButton!
    
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.dataSource = self
        tableView.delegate=self
        
         saveBtn.layer.cornerRadius = 2
        
//        let settingsNames: [String] = ["NAME", "ADDRESS", "INDUSTRY", "PHONE", "WEBSITE","E-MAIL","TRULAR WEBSITE","TRULAR E-MAIL"]
//        
//        let settingsData: [String] = ["Spotify Inc", "Dalagatan 13,stockholm", "Entertainment", "+40890 900 901", "www.spotify.com","quotes@spotify.com","spotify.trular.com","quotes@spotify.trular.com"]
        
        
        datasource = [["heading":"NAME","details":"Spotify Inc","Switch":"NO"],["heading":"ADDRESS","details":"Dalagatan 13,stockholm","Switch":"NO"],["heading":"INDUSTRY","details":"Entertainment","Switch":"NO"],["heading":"PHONE","details":"+40890 900 901","Switch":"NO"],["heading":"WEBSITE","details":"www.spotify.com","Switch":"NO"],["heading":"E-MAIL","details":"quotes@spotify.com","Switch":"NO"],["heading":"TRULAR WEBSITE","details":"spotify.trular.com","Switch":"NO"],["heading":"TRULAR E-MAIL","details":"quotes@spotify.trular.com","Switch":"YES"]]
        

        
//        navigationController?.navigationBar.barTintColor = UIColor.white
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
//        navigationController?.navigationBar.isTranslucent = false
//        self.title = "Settings"

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
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TQMyAccountSettingsCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQMyAccountSettingsCell.self)) as! TQMyAccountSettingsCell
        
        
        cell.dataSource = datasource[indexPath.row] as AnyObject
        
        cell.btnSwitch.isSelected = true
        cell.btnSwitch.setImage(#imageLiteral(resourceName: "green_switch"), for: .selected)
        cell.btnSwitch.setImage(#imageLiteral(resourceName: "switchOff"), for: .normal)
        
        cell.btnSwitch.addTarget(self, action:#selector(self.SwitchbuttonTapped), for: .touchUpInside)
        
        if indexPath.row == datasource.count - 1 {
            cell.separatorEndLineView.isHidden = true
        } else {
            cell.separatorEndLineView.isHidden = false
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 67
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
