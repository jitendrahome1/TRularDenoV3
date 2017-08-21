//
//  TQSettingsClientAdminVC.swift
//  Trular
//
//  Created by Indusnet on 08/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQSettingsVC:  TQBaseViewController,UITableViewDataSource,UITableViewDelegate {
    
    var datasource:[[String:String]]!
    var accountDatasource:[[String:String]]!
    
    @IBOutlet weak var signOutBtn: UIButton!
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        TQHelper.sharedInstance.currentUserType = .VendorAdmin
        self.setupDatasource()
        
        signOutBtn.layer.cornerRadius = 2
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
    
    //MARK:- Datasource setup
    func setupDatasource() {
        
        accountDatasource =
            [["name":"Viggo Svenson","details":"viggo_svenson@spotify.com","profileImg":"clientDummy","showGoldMemberBadge":"NO"],
             ["name":"Spotify Inc.","details":"www.spotify.com","profileImg":"companyDummy","showGoldMemberBadge":"YES"]]
        
        datasource = [["heading":"ACCOUNT TYPE","details":"Vendor","showLine":"YES"],["heading":"SYSTEM SETTINGS","details":"Edit main system information","showLine":"YES"],["heading":"HELP","details":"Have a questions","showLine":"YES"],["heading":"TERMS","details":"Legal & Privacy Policy","showLine":"YES"],["heading":"APP VERSION","details":"Quotes 1.0034","showLine":"YES"],["heading":"SPREAD THE WORD","details":"Tell friends about quotes","showLine":"YES"],["heading":"SEND FEEDBACK","details":"Any suggestions","showLine":"YES"],["heading":"DISCOVER UNKNOWN","details":"Hidden features & functions","showLine":"NO"]]
        
        /*if TQHelper.sharedInstance.currentUserType == .VendorAdmin {
            
            datasource = [["heading":"ACCOUNT TYPE","details":"Vendor","showLine":"YES"],["heading":"SYSTEM SETTINGS","details":"Edit main system information","showLine":"YES"],["heading":"HELP","details":"Have a questions","showLine":"YES"],["heading":"TERMS","details":"Legal & Privacy Policy","showLine":"YES"],["heading":"APP VERSION","details":"Quotes 1.0034","showLine":"YES"],["heading":"SPREAD THE WORD","details":"Tell friends about quotes","showLine":"YES"],["heading":"SEND FEEDBACK","details":"Any suggestions","showLine":"YES"],["heading":"DISCOVER UNKNOWN","details":"Hidden features & functions","showLine":"NO"]]
            
        } else if TQHelper.sharedInstance.currentUserType == .ClientAdmin {
            
            datasource = [["heading":"ACCOUNT TYPE","details":"Client","showLine":"YES"],["heading":"HELP","details":"Have a questions","showLine":"YES"],["heading":"TERMS","details":"Legal & Privacy Policy","showLine":"YES"],["heading":"APP VERSION","details":"Quotes 1.0034","showLine":"YES"],["heading":"SPREAD THE WORD","details":"Tell friends about quotes","showLine":"YES"],["heading":"SEND FEEDBACK","details":"Any suggestions","showLine":"YES"],["heading":"DISCOVER UNKNOWN","details":"Hidden features & functions","showLine":"NO"]]
        }else if TQHelper.sharedInstance.currentUserType == .Client
        {
            datasource = [["heading":"ACCOUNT TYPE","details":"Client","showLine":"YES"],["heading":"HELP","details":"Have a questions","showLine":"YES"],["heading":"TERMS","details":"Legal & Privacy Policy","showLine":"YES"],["heading":"APP VERSION","details":"Quotes 1.0034","showLine":"YES"],["heading":"SPREAD THE WORD","details":"Tell friends about quotes","showLine":"YES"],["heading":"SEND FEEDBACK","details":"Any suggestions","showLine":"YES"],["heading":"DISCOVER UNKNOWN","details":"Hidden features & functions","showLine":"NO"]]
            
        }else if TQHelper.sharedInstance.currentUserType == .Vendor{
            
            datasource = [["heading":"ACCOUNT TYPE","details":"Vender","showLine":"YES"],["heading":"HELP","details":"Have a questions","showLine":"YES"],["heading":"TERMS","details":"Legal & Privacy Policy","showLine":"YES"],["heading":"APP VERSION","details":"Quotes 1.0034","showLine":"YES"],["heading":"SPREAD THE WORD","details":"Tell friends about quotes","showLine":"YES"],["heading":"SEND FEEDBACK","details":"Any suggestions","showLine":"YES"],["heading":"DISCOVER UNKNOWN","details":"Hidden features & functions","showLine":"NO"]]
        }*/
    }
    
    //MARK:- TableView Delegate & Datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        switch section {
        case 0:
            return accountDatasource.count
        default:
            return datasource.count
        }
        
        //client_user
        
        /*if TQHelper.sharedInstance.currentUserType == .VendorAdmin {
            
            return datasource.count + accountDatasource.count
            
        } else if TQHelper.sharedInstance.currentUserType == .ClientAdmin {
            return datasource.count + accountDatasource.count
            
        }else if TQHelper.sharedInstance.currentUserType == .Client
        {
            return datasource.count + accountDatasource.count
            
        }else {
            return datasource.count + accountDatasource.count
        }*/
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let accountCell:TQSettingsAccountCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQSettingsAccountCell.self)) as! TQSettingsAccountCell
            accountCell.dataSource = self.accountDatasource[indexPath.row] as AnyObject
            
            return accountCell
        } else {
            
            let detailsCell:TQSettingsInfoCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQSettingsInfoCell.self)) as! TQSettingsInfoCell
            detailsCell.dataSource = self.datasource[indexPath.row] as AnyObject

            if indexPath.row == datasource.count - 1 {
                detailsCell.separatorEndLineView.isHidden = true
            } else {
                detailsCell.separatorEndLineView.isHidden = false
            }
            
            return detailsCell
        }
        
        /*if TQHelper.sharedInstance.currentUserType == .VendorAdmin {
            
            if (indexPath.row == 0)
            {
                let cell: TQSettinsMainCell1 = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQSettinsMainCell1.self)) as! TQSettinsMainCell1
                
                return cell
            }else if (indexPath.row == 1)
            {
                let cell: TQSettingsAccountCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQSettingsAccountCell.self)) as! TQSettingsAccountCell
                
                
                return cell
            }else
            {
                let cell: TQSettingsInfoCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQSettingsInfoCell.self)) as! TQSettingsInfoCell
                
                
                cell.dataSource = datasource[indexPath.row-2] as AnyObject
                
                if indexPath.row == 9 {
                    cell.separatorEndLineView.isHidden = true
                } else {
                    cell.separatorEndLineView.isHidden = false
                }
                
                return cell
            }
            
        } else if TQHelper.sharedInstance.currentUserType == .ClientAdmin {
            if (indexPath.row == 0)
            {
                let cell: TQSettinsMainCell1 = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQSettinsMainCell1.self)) as! TQSettinsMainCell1
                
                return cell
            }else if (indexPath.row == 1)
            {
                let cell: TQSettingsAccountCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQSettingsAccountCell.self)) as! TQSettingsAccountCell
                
                
                return cell
            }else
            {
                let cell: TQSettingsInfoCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQSettingsInfoCell.self)) as! TQSettingsInfoCell
                
                
                cell.dataSource = datasource[indexPath.row-2] as AnyObject
                
                if indexPath.row == datasource.count + 1 {
                    cell.separatorEndLineView.isHidden = true
                } else {
                    cell.separatorEndLineView.isHidden = false
                }
                
                return cell
            }
            
        }else if TQHelper.sharedInstance.currentUserType == .Client
        {
            if (indexPath.row == 0)
            {
                let cell: TQSettinsMainCell1 = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQSettinsMainCell1.self)) as! TQSettinsMainCell1
                
                return cell
            }else
            {
                let cell: TQSettingsInfoCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQSettingsInfoCell.self)) as! TQSettingsInfoCell
                
                cell.dataSource = datasource[indexPath.row-1] as AnyObject
                
                if indexPath.row == datasource.count {
                    cell.separatorEndLineView.isHidden = true
                } else {
                    cell.separatorEndLineView.isHidden = false
                }
                
                return cell
            }
            
        }else {
            
            if (indexPath.row == 0)
            {
                let cell: TQSettinsMainCell1 = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQSettinsMainCell1.self)) as! TQSettinsMainCell1
                
                return cell
            }else if (indexPath.row == 1)
            {
                let cell: TQSettingsAccountCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQSettingsAccountCell.self)) as! TQSettingsAccountCell
                
                
                return cell
            }else
            {
                let cell: TQSettingsInfoCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing: TQSettingsInfoCell.self)) as! TQSettingsInfoCell
                
                
                cell.dataSource = datasource[indexPath.row-2] as AnyObject
                
                if indexPath.row == datasource.count + 1 {
                    cell.separatorEndLineView.isHidden = true
                } else {
                    cell.separatorEndLineView.isHidden = false
                }
                
                return cell
            }
        }*/
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 72
        
        /*if indexPath.row == 0
        {
            return 95
        }else if indexPath.row == 1
        {
            return 72
        }
        else
        {
            return 72
        }*/
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "MY ACCOUNT"
        case 1:
            return ""
            
        default:
            return ""
        }
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header = view as! UITableViewHeaderFooterView
        
        header.textLabel?.font = UIFont.init(name: BOLD_FONT_NAME, size: 10.0)
        header.textLabel?.textColor = UIColor.colorWithHexString("#a8acbb")
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.white
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if TQHelper.sharedInstance.currentUserType == .VendorAdmin {
            
            switch indexPath.section {
            case 0:
                switch indexPath.row {
                case 0:
                    
                    TQNavigationHelper.sharedInstance.pushViewController(storyboard: settingsStoryboard, viewController: "TQSettingsClientAccountVC")
                    break
                case 1:
                    TQNavigationHelper.sharedInstance.pushViewController(storyboard: settingsStoryboard, viewController: "TQSettingsCompanyAccountVC")
                    break
                default:
                    break
                }
                
            case 1:
                switch indexPath.row {
                case 1:
                    TQNavigationHelper.sharedInstance.pushViewController(storyboard: settingsStoryboard, viewController: "TQSettingsSystemSettingsVC")

                    break
                case 2:
                    TQNavigationHelper.sharedInstance.pushViewController(storyboard: settingsStoryboard, viewController: "TQSettingsHelpVC")

                    break
                case 3:
                    TQNavigationHelper.sharedInstance.pushViewController(storyboard: settingsStoryboard, viewController: "TQSettingsTermsVC")

                    break
                case 5:
                    TQNavigationHelper.sharedInstance.pushViewController(storyboard: settingsStoryboard, viewController: "TQSettingsSpreadTheWordVC")

                    break
                case 6:
                    TQNavigationHelper.sharedInstance.pushViewController(storyboard: settingsStoryboard, viewController: "TQSettingsFeedbackVC")

                    break
                case 7:
                    TQNavigationHelper.sharedInstance.pushViewController(storyboard: settingsStoryboard, viewController: "TQSettingsDiscoverUnknownVC")

                    break
                default:
                    break
                }
            default:
                break
            }
            
            
            /*if indexPath.row==0 {
                
                
            }else if indexPath.row==1 {
                
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsCompanyAccountVC") as! TQSettingsCompanyAccountVC
                self.navigationController?.pushViewController(controller, animated: true)
                
            }else if indexPath.row==7 {
                
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsSpreadTheWordVC") as! TQSettingsSpreadTheWordVC
                self.navigationController?.pushViewController(controller, animated: true)
            }else if indexPath.row==8 {
                
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsFeedbackVC") as! TQSettingsFeedbackVC
                self.navigationController?.pushViewController(controller, animated: true)
            }else if indexPath.row==4 {
                
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsHelpVC") as! TQSettingsHelpVC
                self.navigationController?.pushViewController(controller, animated: true)
            }else if indexPath.row==5 {
                
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsTermsVC") as! TQSettingsTermsVC
                self.navigationController?.pushViewController(controller, animated: true)
            }else if indexPath.row==3 {
                
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsSystemSettingsVC") as! TQSettingsSystemSettingsVC
                self.navigationController?.pushViewController(controller, animated: true)
            }else if indexPath.row==9 {
                
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsDiscoverUnknownVC") as! TQSettingsDiscoverUnknownVC
                self.navigationController?.pushViewController(controller, animated: true)
            }
            
        } else if  TQHelper.sharedInstance.currentUserType == .ClientAdmin {
            
            if indexPath.row==0 {
                
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsClientAccountVC") as! TQSettingsClientAccountVC
                self.navigationController?.pushViewController(controller, animated: true)
                
            }else if indexPath.row==1 {
                
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsCompanyAccountVC") as! TQSettingsCompanyAccountVC
                self.navigationController?.pushViewController(controller, animated: true)
            }else if indexPath.row==6 {
                
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsSpreadTheWordVC") as! TQSettingsSpreadTheWordVC
                self.navigationController?.pushViewController(controller, animated: true)
            }else if indexPath.row==7 {
                
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsFeedbackVC") as! TQSettingsFeedbackVC
                self.navigationController?.pushViewController(controller, animated: true)
            }else if indexPath.row==3 {
                
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsHelpVC") as! TQSettingsHelpVC
                self.navigationController?.pushViewController(controller, animated: true)
            }else if indexPath.row==4 {
                
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsTermsVC") as! TQSettingsTermsVC
                self.navigationController?.pushViewController(controller, animated: true)
            }else if indexPath.row==8 {
                
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsDiscoverUnknownVC") as! TQSettingsDiscoverUnknownVC
                self.navigationController?.pushViewController(controller, animated: true)
            }
            
        } else if  TQHelper.sharedInstance.currentUserType == .Client {
            
            //client_user
            
            if indexPath.row==0 {
                
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsClientAccountVC") as! TQSettingsClientAccountVC
                self.navigationController?.pushViewController(controller, animated: true)
                
            }else if indexPath.row==5 {
                
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsSpreadTheWordVC") as! TQSettingsSpreadTheWordVC
                self.navigationController?.pushViewController(controller, animated: true)
            }else if indexPath.row==6 {
                
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsFeedbackVC") as! TQSettingsFeedbackVC
                self.navigationController?.pushViewController(controller, animated: true)
            }else if indexPath.row==2 {
                
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsHelpVC") as! TQSettingsHelpVC
                self.navigationController?.pushViewController(controller, animated: true)
            }else if indexPath.row==3 {
                
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsTermsVC") as! TQSettingsTermsVC
                self.navigationController?.pushViewController(controller, animated: true)
            }else if indexPath.row==7 {
                
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsDiscoverUnknownVC") as! TQSettingsDiscoverUnknownVC
                self.navigationController?.pushViewController(controller, animated: true)
            }
            
            
        }else if  TQHelper.sharedInstance.currentUserType == .Vendor {
            
            if indexPath.row==0 {
                
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsClientAccountVC") as! TQSettingsClientAccountVC
                self.navigationController?.pushViewController(controller, animated: true)
                
            }else if indexPath.row==6 {
                
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsSpreadTheWordVC") as! TQSettingsSpreadTheWordVC
                self.navigationController?.pushViewController(controller, animated: true)
            }else if indexPath.row==7 {
                
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsFeedbackVC") as! TQSettingsFeedbackVC
                self.navigationController?.pushViewController(controller, animated: true)
            }else if indexPath.row==3 {
                
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsHelpVC") as! TQSettingsHelpVC
                self.navigationController?.pushViewController(controller, animated: true)
            }else if indexPath.row==4 {
                
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsTermsVC") as! TQSettingsTermsVC
                self.navigationController?.pushViewController(controller, animated: true)
            }else if indexPath.row==8 {
                
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "TQSettingsDiscoverUnknownVC") as! TQSettingsDiscoverUnknownVC
                self.navigationController?.pushViewController(controller, animated: true)
            }*/
        }
    }
}
