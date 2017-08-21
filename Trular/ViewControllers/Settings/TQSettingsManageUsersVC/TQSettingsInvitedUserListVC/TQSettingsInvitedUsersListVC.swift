//
//  TQSettingsClientCompanyAccManageUsersInvitedVC.swift
//  Trular
//
//  Created by Indusnet on 12/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip


class TQSettingsInvitedUsersListVC: UIViewController,IndicatorInfoProvider,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var addBtn: UIButton!
    var datasource:[[String:String]]!
  
    override func viewDidLoad() {
        super.viewDidLoad()
  self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate=self

        datasource = [["heading":"Marcus Besson","details":"Marcus_b@Spotify.com"],["heading":"Jennifer North","details":"jenny_north@vans.com"],["heading":"Viggo Svenson","details":"viggo_svenson@hotmail.com"],["heading":"Ellen Stonebridge","details":"ellen_stonebridge@dropbox.com"]]
        

    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TQInvitedusersListCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQInvitedusersListCell.self)) as! TQInvitedusersListCell
        
        cell.dataSource = datasource[indexPath.row] as AnyObject
        
        return cell
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
//        if indexPath.row==3 {
//            
//              return 92
//        }else{
//            return 72
//        }
        
        
        
        return 72
      
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettngsManageUserProfileVC") as! TQSettngsManageUserProfileVC
        self.navigationController?.pushViewController(controller, animated: true)
        

        
        
    }
    
    @IBAction func addBtnAction(_ sender: Any) {
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsAddInvitedUserVC") as! TQSettingsAddInvitedUserVC
        self.navigationController?.pushViewController(controller, animated: true)

    }
    
    
    
    //MARK:- Tab Pager Delegate
    //For Title
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        
                  return IndicatorInfo.init(title: "INVITED")
       
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
