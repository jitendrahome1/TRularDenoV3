//
//  TQAddReminderVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 18/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQAddReminderVC: TQBaseViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var saveBtn: UIButton!
    @IBOutlet var reminderTextField: UITextField!
    
    var datasource:[[String:String]]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        datasource = [["intervalType":"Minutes","isSelected":"0"],
                      ["intervalType":"Hours","isSelected":"0"],
                      ["intervalType":"Days","isSelected":"0"],
                      ["intervalType":"Weeks","isSelected":"0"],
                      ["intervalType":"Months","isSelected":"0"]]
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(self.didTap(_:)))
        self.view.addGestureRecognizer(tap)
        
        self.saveBtn.layer.cornerRadius = 2
        self.reminderTextField.inputAccessoryView = self.setupInputAccessoryView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // Do any additional setup after loading the view.
        
        self.showSidePanel = false
        self.hideNavigationBar = false
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackGray"), barTintColor: .white, itemTintColor: .lightGray,isBarTranslucent: false)
        
        self.setNavigationTitle(title: "Calendar", titleColor: .colorWithHexString("#404041"), subtitle: "Create an event"+bulletUnicode+"Reminder", subtitleColor: .lightGray)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- UITableView Delegate & Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let addReminderCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing:TQAddReminderCell.self)) as! TQAddReminderCell
        
        addReminderCell.dataSource = self.datasource[indexPath.row] as AnyObject
        
        return addReminderCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    //MARK:- Button Actions
    @IBAction func saveAction(_ sender: UIButton) {
        TQNavigationHelper.sharedInstance.contentMainNavVC.popViewController(animated: true)
    }

    //MARK:- Gesture Recognizer
    func didTap(_ recognizer:UITapGestureRecognizer) {
        
        self.view.endEditing(true)
    }
    
    //MARK:- Accessory View
    
    func setupInputAccessoryView() -> UIView {
        
        let accessoryView = UIToolbar()
        
        let cancelBtn = UIBarButtonItem.init(title: "Cancel", style: .plain, target: self, action: nil)
        
        cancelBtn.setTitleTextAttributes([NSFontAttributeName:UIFont(name: FONT_NAME, size: 14)!,NSForegroundColorAttributeName:UIColor.colorWithHexString("#A8ACBB")], for: .normal)
        
        let doneBtn = UIBarButtonItem.init(title: "Done", style: .plain, target: self, action: nil)
        
        doneBtn.setTitleTextAttributes([NSFontAttributeName:UIFont(name: BOLD_FONT_NAME, size: 18)!,NSForegroundColorAttributeName:UIColor.colorWithHexString("#404041")], for: .normal)
        
        let flexSpace = UIBarButtonItem.init(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        accessoryView.sizeToFit()
        accessoryView.setItems([cancelBtn,flexSpace,doneBtn], animated: true)
        accessoryView.backgroundColor = .white
        return accessoryView
    }

}
