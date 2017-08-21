//
//  TQSettingsClientCompanyAccManageUsersUsersVC.swift
//  Trular
//
//  Created by Indusnet on 12/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip


class TQSettingsExistingUsersListVC: UIViewController,IndicatorInfoProvider,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
     var datasource:[[String:String]]!

    override func viewDidLoad() {
        super.viewDidLoad()
     self.navigationController?.isNavigationBarHidden = true
        tableView.dataSource = self
        tableView.delegate=self
        // Do any additional setup after loading the view.
        
          datasource = [["heading":"Marcus Besson","details":"Marcus_b@Spotify.com"],["heading":"Stockholm","details":"Last logged in: 28/04/2017 . 11:31"],["heading":"Ellen Stonebridge","details":"ellen_stonebridge@spotify.com"]]
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "B"
        case 1:
            return "N"
        case 2:
            return "S"
        default:
            return "non"
        }
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header = view as! UITableViewHeaderFooterView
        
        header.textLabel?.font = UIFont.init(name: BOLD_FONT_NAME, size: 10.0)
        header.textLabel?.textColor = UIColor.colorWithHexString("#a8acbb")
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.white
        
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: TQExistingUserListCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQExistingUserListCell.self)) as! TQExistingUserListCell
        
          cell.dataSource = datasource[indexPath.row] as AnyObject
        
        let removeBtn = MGSwipeButton(title: "Hide", icon:#imageLiteral(resourceName: "remove") , backgroundColor: .colorWithHexString("#EC4030"))
        removeBtn.tintColor = .white
        removeBtn.titleLabel?.font = UIFont.init(name: MEDIUM_FONT_NAME, size: 10.0)
        removeBtn.centerVertically()
        removeBtn.buttonWidth = 75
        cell.rightButtons = [removeBtn]
        
        cell.rightSwipeSettings.transition = .drag
        
        if indexPath.section == 2 {
            cell.separator.isHidden = true
        } else {
            cell.separator.isHidden = false
        }
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
    return 72
    
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
       
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettngsManageUserProfileVC") as! TQSettngsManageUserProfileVC
         self.navigationController?.pushViewController(controller, animated: true)
        
        
        
    }
    //MARK:- Tab Pager Delegate
    //For Title
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        
       
            return IndicatorInfo.init(title: "USERS")
    
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
