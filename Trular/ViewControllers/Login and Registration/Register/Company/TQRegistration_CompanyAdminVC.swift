//
//  TQRegistration_CompanyAdminVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 29/05/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQRegistration_CompanyAdminVC: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {

    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var continueBtnBottomConstraint: NSLayoutConstraint!
    @IBOutlet var continueBtn: UIButton!
    
    var adminNameTF:UITextField?
    var adminEmailTF:UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.navigationController?.isNavigationBarHidden = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil);
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0
        {
            var blankCell = tableView.dequeueReusableCell(withIdentifier: "blankCell")
            
            if (blankCell == nil)
            {
                blankCell = UITableViewCell(style: .default, reuseIdentifier: "blankCell")
            }
            
            return blankCell!
        }
        else if (indexPath.row == 1)
        {
            var registration_adminNameCell = tableView.dequeueReusableCell(withIdentifier: "registration_adminNameCell")
            
            if (registration_adminNameCell == nil)
            {
                registration_adminNameCell = UITableViewCell(style: .default, reuseIdentifier: "registration_adminNameCell")
            }
            
            adminNameTF = registration_adminNameCell?.viewWithTag(3333) as? UITextField
            
            return registration_adminNameCell!
        }
        else
        {
            var registration_adminEmailCell = tableView.dequeueReusableCell(withIdentifier: "registration_adminEmailCell")
            
            if (registration_adminEmailCell == nil)
            {
                registration_adminEmailCell = UITableViewCell(style: .default, reuseIdentifier: "registration_adminEmailCell")
            }
            
            adminEmailTF = registration_adminEmailCell?.viewWithTag(3334) as? UITextField
            
            return registration_adminEmailCell!
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let cellHeight = tableView.frame.height / 3
        
        if (indexPath.row == 0)
        {
            return cellHeight
        }
        else
        {
            return IS_IPAD() ? 113 : 93
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 1:
            adminNameTF?.becomeFirstResponder()
        case 2:
            adminNameTF?.resignFirstResponder()
            adminEmailTF?.becomeFirstResponder()
        default:
            break
        }
    }
    
    //MARK: - Button Actions
    
    @IBAction func continueToPasswordAction(_ sender: UIButton) {
        
        self.view.endEditing(true)
//        print(TQHelper.sharedInstance.registrationInfoDict!)
        
        /*guard let adminEmail:String = TQHelper.sharedInstance.registrationInfoDict?[ADMIN_EMAIL] as? String
            else
        {
            self.view.showToastWithMessage(BLANK_EMAIL)
            return
        }
        
        guard let adminName:String = TQHelper.sharedInstance.registrationInfoDict?[ADMIN_NAME] as? String
            else
        {
            self.view.showToastWithMessage(BLANK_NAME)
            return
        }

        if (adminEmail.isBlank) {
            self.view.showToastWithMessage(BLANK_EMAIL)
        } else if (adminName.isBlank) {
            self.view.showToastWithMessage(BLANK_NAME)
        } else if (!adminEmail.isValidEmail) {
            self.view.showToastWithMessage(ENTER_VALID_EMAILID)
        } else {*/
            
            let registration_PasswordVC = mainStoryboard.instantiateViewController(withIdentifier: String(describing: TQRegistration_PasswordVC.self)) as! TQRegistration_PasswordVC
            
            TQNavigationHelper.sharedInstance.loginContainerNavigation.pushViewController(registration_PasswordVC, animated: true)
//        }
    }
    
    // MARK: - Keyboard Notifications
    
    func keyboardWillShow(notification: NSNotification) {
        let info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        print("keyboardFrame: \(keyboardFrame)")
        continueBtnBottomConstraint.constant = keyboardFrame.height
    }
    
    func keyboardWillHide(notification: NSNotification) {
        let info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        print("keyboardFrame: \(keyboardFrame)")
        continueBtnBottomConstraint.constant = 0
    }
    
    //MARK: - Textfield Delegates
    /*func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        print(TQHelper.sharedInstance.registrationInfoDict!)
        
        switch textField.tag {
        case 3333:
            adminNameTF!.resignFirstResponder()
            adminEmailTF!.becomeFirstResponder()
            return true
            
        case 3334:
            adminEmailTF!.resignFirstResponder()
            self.continueBtn.sendActions(for: .touchUpInside)
            return true
        default:
            return false
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        print(textField.text!)
        print(TQHelper.sharedInstance.registrationInfoDict!)
        
        switch textField.tag {
        case 3333:
            TQHelper.sharedInstance.registrationInfoDict![ADMIN_NAME] = textField.text as AnyObject
            return true
            
        case 3334:
            TQHelper.sharedInstance.registrationInfoDict![ADMIN_EMAIL] = textField.text as AnyObject
            return true
        default:
            return false
        }
    }*/

    /*func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        switch textField.tag {
        case 3333:
            TQHelper.sharedInstance.registrationInfoDict![ADMIN_NAME] = textField.text as AnyObject
            return true
            
        case 3334:
            TQHelper.sharedInstance.registrationInfoDict![ADMIN_EMAIL] = textField.text as AnyObject
            return true
        default:
            return false
        }
    }*/

}
