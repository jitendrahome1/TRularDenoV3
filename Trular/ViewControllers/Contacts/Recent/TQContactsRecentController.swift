//
//  TQClientRecentController.swift
//  Trular
//
//  Created by Jitendra on 6/14/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQContactsRecentController: TQBaseViewController, UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var aTableView: UITableView!
    var sectionsTitle  = [String]()
    var arrClientImgs = [String]()
    var arrClientName = [String]()
    var arrClintDispt = [String]()
    var arrClientData = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.UISetup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK:- UI Setup Function
    
    func UISetup(){
          sectionsTitle = ["TODAY","YESTERDAY","FRIDAY"]
        
        self.arrClientName = ["Marcus Besson"+bulletUnicode+"HBO Europe", "Jennifer North"+bulletUnicode+"Vans","Viggo svenson"+bulletUnicode+"Spotify Inc","Ellen Stonebridge"+bulletUnicode+"Dropbox"]
        
        self.arrClientImgs = ["clientDummy.png","clientDummy2.png","clientDummy.png","companyDummy.png"]
        self.arrClintDispt = ["Hi, i saw the latest quotes","Hi, i saw the latest quotes","Hi, i saw the latest quotes","Accepted your ask for contact"]
       // We are Load a Data for testing.
        
        for index in 0..<sectionsTitle.count
        {
            let dictData = ["clientName" : arrClientName[index] as AnyObject , "clientDispt": arrClintDispt[index] as AnyObject,"clientImg":arrClientImgs[index] as AnyObject]
            self.arrClientData.append((dictData) as AnyObject)
        }
        if arrClientData.count > 0 {
            self.aTableView.reloadData()
        }
    }
    
    //MARK:- Tableview Datasource and Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsTitle.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let contactRecentCell : TQContactsRecentCell = self.aTableView.dequeueReusableCell(withIdentifier: "TQContactsRecentCell") as! TQContactsRecentCell
        contactRecentCell.dataSource = self.arrClientData[indexPath.section]
       
        
        return contactRecentCell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return self.sectionsTitle[section]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
    }
    
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header = view as! UITableViewHeaderFooterView
        
        header.textLabel?.font = UIFont.init(name: BOLD_FONT_NAME, size: 10.0)
        header.textLabel?.textColor = UIColor.colorWithHexString("#a8acbb")
        
        
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.white
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }


}
