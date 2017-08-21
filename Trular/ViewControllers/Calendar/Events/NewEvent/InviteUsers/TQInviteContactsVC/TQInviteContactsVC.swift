//
//  TQInviteContactsVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 20/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQInviteContactsVC: TQBaseViewController,UITableViewDelegate,UITableViewDataSource,IndicatorInfoProvider {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var inviteByEmailBtn: UIButton!
    
    var datasource:[[String:String]]!
    var sectionDatasource:[Character]!
    var completeDatasource:[Character: [[String:String]]]!
    
    var nameDatasource = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datasource = [["name":"Viggo Svenson","companyy":"Spotify Inc.","email":"viggo_svenson@potify.com"],
                      ["name":"Marcus Besson","companyy":"HBO Europe","email":"viggo_svenson@potify.com"],
                      ["name":"Ellen Stonebridge","companyy":"Dropbox","email":"viggo_svenson@potify.com"],
                      ["name":"Jennifer North","companyy":"Vans","email":"viggo_svenson@potify.com"],
                      ["name":"Heather McNamara","companyy":"Netflix","email":"viggo_svenson@potify.com"]]
        
        for dict in datasource {
            
            let name:String = dict["name"]!
            nameDatasource.append(name)
        }
        
        sectionDatasource = self.getSectionsFromData(data: self.nameDatasource)
        completeDatasource = self.getCompleteDatsourceFromData(data: datasource)
        self.tableView.reloadData()
        
        self.inviteByEmailBtn.layer.cornerRadius = 2
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Construct Datasource
    func getSectionsFromData(data:[String]) -> [Character] {
        var letters: [Character]
        
        letters = data.map { (name) -> Character in
            
            let lastName = name.components(separatedBy: " ")
            
            if lastName.count > 0 {
                
                if let idx = name.index(of: lastName.last!) {
                    return name[idx]
                } else {
                    return name[name.startIndex]
                }
                
            } else {
                return name[name.startIndex]
            }
        }
        
        letters = letters.sorted()
        
        letters = letters.reduce([], { (list, name) -> [Character] in
            if !list.contains(name) {
                return list + [name]
            }
            return list
        })
        
        return letters
    }
    
    func getCompleteDatsourceFromData(data:[[String:String]]) -> [Character: [[String:String]]] {
        
        // Build contacts array:
        
        var contacts = [Character: [[String:String]]]()
        
        for dict in data {
            
            if let entry = dict["name"] {
                let lastName = entry.components(separatedBy: " ")
                
                if lastName.count > 0 {
                    
                    if let idx = entry.index(of: lastName.last!) {
                        
                        if contacts[entry[idx]] == nil {
                            contacts[entry[idx]] = [[String:String]]()
                        }
                        contacts[entry[idx]]!.append(dict)
                        
                    } else {
                        
                        if contacts[entry[entry.startIndex]] == nil {
                            contacts[entry[entry.startIndex]] = [[String:String]]()
                        }
                        contacts[entry[entry.startIndex]]!.append(dict)
                    }
                    
                } else {
                    if contacts[entry[entry.startIndex]] == nil {
                        contacts[entry[entry.startIndex]] = [[String:String]]()
                    }
                    contacts[entry[entry.startIndex]]!.append(dict)
                }
                
            }
            
        }
        
        for (letter, list) in contacts {
            
            if list.count > 1 {
                contacts[letter] = list.sorted {$0["name"]! < $1["name"]!}
            } else {
                contacts[letter] = list
            }
        }
        
        return contacts
    }
    
    //MARK:- TableView Datasource and Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if sectionDatasource != nil {
            return sectionDatasource.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if completeDatasource != nil {
            
            if let idx = completeDatasource[sectionDatasource[section]] {
                return idx.count
                
            } else {
                return 0
            }
            
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let inviteContactsCell : TQInviteContactsCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing:TQInviteContactsCell.self)) as! TQInviteContactsCell
        
        inviteContactsCell.dataSource = completeDatasource[sectionDatasource[indexPath.section]]![indexPath.row] as AnyObject
        
        return inviteContactsCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if sectionDatasource != nil {
            return "\(sectionDatasource[section])"
        } else {
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header = view as! UITableViewHeaderFooterView
        
        header.textLabel?.font = UIFont.init(name: BOLD_FONT_NAME, size: 10.0)
        header.textLabel?.textColor = UIColor.colorWithHexString("#a8acbb")
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.white
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82.0
    }
   
    //MARK:- Tab Pager Delegate
    //For Title
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo.init(title: "CONTACTS")
    }
    
    //MARK:- Button Actions
    @IBAction func inviteBtnAction(_ sender: UIButton) {
        
        TQNavigationHelper.sharedInstance.pushViewController(storyboard: quotesStoryboard, viewController: String(describing: TQInviteByEmailVC.self))
    }
    
}
