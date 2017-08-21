//
//  TQAddNewClientViewController.swift
//  Trular
//
//  Created by Jitendra on 6/12/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQSearchClientViewController: TQBaseViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var lblHeaderTitle: UILabel!
    
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var aTableView: UITableView!
    var dictData = [String : AnyObject]()
    var arrItems = [AnyObject]()
    var placeHolderData  = [String]()
    var valueList = [String]()
    @IBOutlet weak var btnSearch: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.tabBar.isHidden = true
        self.UISetup(isCompany: true)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackWhite"), barTintColor: .colorWithHexString("#008BFF"), itemTintColor: .white,isBarTranslucent: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:- UI Setup Function
    
    func UISetup(isCompany:Bool){
        
        if isCompany {
            self.placeHolderData = ["TYPE", "NAME","COMPANY","EMAIL","PHONE"]
            self.valueList = ["Company","Jenn","Vans","defult@email.com","+480001234"]
        } else {
            self.placeHolderData = ["TYPE", "NAME","EMAIL","PHONE"]
            self.valueList = ["Private","Jenn","defult@email.com","+480001234"]
        }
        self.dictData.removeAll()
        self.arrItems.removeAll()
        // Make A local dict to assign placeholder and data.
        for index in 0..<placeHolderData.count
        {
            self.dictData = ["placeHolder" : placeHolderData[index] as AnyObject , "dataValue": valueList[index] as AnyObject]
            self.arrItems.append(dictData as AnyObject)
        }
        if arrItems.count > 0 {
            self.aTableView.reloadData()
        }
        self.btnSearch.layer.borderWidth = 1.0
        self.btnSearch.layer.borderColor = UIColor.white.cgColor
    }
    
    @IBAction func actionSearch(_ sender: UIButton) {
        
        TQNavigationHelper.sharedInstance.pushViewController(storyboard: userListStoryboard, viewController: String(describing: TQClientSearchResultViewController.self))
        
//        let addClientVC = userListStoryboard.instantiateViewController(withIdentifier: String(describing: TQAddNewClientViewController.self)) as! TQAddNewClientViewController
//        self.navigationController?.pushViewController(addClientVC, animated: true)
    }
    
    //MARK:- Tableview Datasource and Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let clientAddCell : TQSearchClientCell = self.aTableView.dequeueReusableCell(withIdentifier: "TQSearchClientCell") as! TQSearchClientCell
        clientAddCell.shouldDisableLabels = true
        
        clientAddCell.dataSource = arrItems[indexPath.row]
        return clientAddCell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 66
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            self.showActionSheet()
        }
    }
    
}
// MARK:- User Define Function
extension TQSearchClientViewController {
    func showActionSheet(){
        
        let actionSheet = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let privateAction = UIAlertAction.init(title: "Private", style: .default, handler: { (UIAlertAction) in
            
            self.UISetup(isCompany: false)
            self.dismiss(animated: true, completion: nil)
            print("Private")
            
        })
        let companyAction = UIAlertAction.init(title: "Company", style: .default, handler: { (UIAlertAction) in
            
            self.UISetup(isCompany: true)
            self.dismiss(animated: true, completion: nil)
            print("Company")
            
        })
        
        let cancelAction = UIAlertAction.init(title: "Cancel", style: .cancel, handler: { (UIAlertAction) in
            self.dismiss(animated: true, completion: nil)
            print("Cancel")
        })
        
        privateAction.setValue(UIColor.colorWithHexString("#404041"), forKey: "titleTextColor")
        companyAction.setValue(UIColor.colorWithHexString("#404041"), forKey: "titleTextColor")
        cancelAction.setValue(UIColor.colorWithHexString("#A8ACBB"), forKey: "titleTextColor")
        
        actionSheet.addAction(privateAction)
        actionSheet.addAction(companyAction)
        actionSheet.addAction(cancelAction)
        
        self.present(actionSheet, animated: true, completion: nil)
    }
}
