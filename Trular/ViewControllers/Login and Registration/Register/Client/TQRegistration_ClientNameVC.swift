//
//  TQRegistration_ClientNameVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 29/05/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQRegistration_ClientNameVC: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate {

    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var continueBtnBottomConstraint: NSLayoutConstraint!
    @IBOutlet var continueBtn: UIButton!
    
    var nameTF:UITextField?
    var emailTF:UITextField?
    
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
            var registration_clientNameCell = tableView.dequeueReusableCell(withIdentifier: "registration_clientNameCell")
            
            if (registration_clientNameCell == nil)
            {
                registration_clientNameCell = UITableViewCell(style: .default, reuseIdentifier: "registration_clientNameCell")
            }
            
            nameTF = registration_clientNameCell?.viewWithTag(2111) as? UITextField
            
            return registration_clientNameCell!
        }
        else
        {
            var registration_clientEmailCell = tableView.dequeueReusableCell(withIdentifier: "registration_clientEmailCell")
            
            if (registration_clientEmailCell == nil)
            {
                registration_clientEmailCell = UITableViewCell(style: .default, reuseIdentifier: "registration_clientEmailCell")
            }
            
            emailTF = registration_clientEmailCell?.viewWithTag(2112) as? UITextField
            
            return registration_clientEmailCell!
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
            nameTF?.becomeFirstResponder()
        case 2:
            emailTF?.becomeFirstResponder()
        default:
            break
        }
    }
    
    //MARK: - Button Actions
    
    @IBAction func continueToPasswordAction(_ sender: UIButton) {
        
        self.view.endEditing(true)
//        print(TQHelper.sharedInstance.registrationInfoDict!)
        
        /*guard let email:String = TQHelper.sharedInstance.registrationInfoDict?[EMAIL] as? String
            else
        {
            self.view.showToastWithMessage(BLANK_EMAIL)
            return
        }
        
        guard let name:String = TQHelper.sharedInstance.registrationInfoDict?[NAME] as? String
            else
        {
            self.view.showToastWithMessage(BLANK_NAME)
            return
        }
        
        if (email.isBlank) {
            self.view.showToastWithMessage(BLANK_EMAIL)
        } else if (name.isBlank) {
            self.view.showToastWithMessage(BLANK_NAME)
        } else if (!email.isValidEmail) {
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
    /*func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        print(textField.text!)
        print(TQHelper.sharedInstance.registrationInfoDict!)
        
        switch textField.tag {
        case 2111:
            TQHelper.sharedInstance.registrationInfoDict![NAME] = textField.text as AnyObject
            return true
            
        case 2112:
            TQHelper.sharedInstance.registrationInfoDict![EMAIL] = textField.text as AnyObject
            return true
        default:
            return false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField.tag {
        case 2111:
            nameTF?.resignFirstResponder()
            emailTF?.becomeFirstResponder()
            return true
            
        case 2112:
            emailTF?.resignFirstResponder()
            self.continueBtn.sendActions(for: .touchUpInside)
            return true
        default:
            return false
        }
    }*/


    /*func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        switch textField.tag {
        case 2111:
            TQHelper.sharedInstance.registrationInfoDict![NAME] = textField.text as AnyObject
            return true
            
        case 2112:
            TQHelper.sharedInstance.registrationInfoDict![EMAIL] = textField.text as AnyObject
            return true
        default:
            return false
        }
        
    }*/

}
