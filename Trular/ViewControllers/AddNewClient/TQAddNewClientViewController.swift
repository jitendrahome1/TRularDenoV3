//
//  TQAddNewClientViewController.swift
//  Trular
//
//  Created by Jitendra on 6/12/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQAddNewClientViewController: TQBaseViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var aTableView: UITableView!
    
    @IBOutlet weak var lblHeaderTitle: UILabel!
    
    @IBOutlet weak var lblSubHeaderTitle: UILabel!
    @IBOutlet weak var btnAddUser: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.UISetup()
        self.tabBarController?.tabBar.isHidden = true
        
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
    
    func UISetup(){
    self.btnAddUser.layer.borderWidth = 1.0
    self.btnAddUser.layer.borderColor = UIColor.white.cgColor
    }
  
    //MARK:- Tableview Datasource and Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let clientAddCell : TQAddNewClientCell = self.aTableView.dequeueReusableCell(withIdentifier: "TQAddNewClientCell") as! TQAddNewClientCell
        
        (clientAddCell ).didTapPluse = { (sender) in
        
        }
        return clientAddCell
        
    }
    
    @IBAction func addUserAction(_ sender: UIButton) {
        
        TQNavigationHelper.sharedInstance.pushViewController(storyboard: userListStoryboard, viewController: String(describing:TQContactsInviteNewUser.self))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 90
    }
}
