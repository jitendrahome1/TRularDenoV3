//
//  TQRegistration_PasswordVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 29/05/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQRegistration_PasswordVC: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var continueBtnBottomConstraint: NSLayoutConstraint!
    @IBOutlet var createAccountBtn: UIButton!
    
    var passwordTF:UITextField?
    var confirmPasswordTF:UITextField?
    
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
            var registration_passwordCell = tableView.dequeueReusableCell(withIdentifier: "registration_passwordCell")
            
            if (registration_passwordCell == nil)
            {
                registration_passwordCell = UITableViewCell(style: .default, reuseIdentifier: "registration_passwordCell")
            }
            
            passwordTF = registration_passwordCell?.viewWithTag(4444) as? UITextField
            
            return registration_passwordCell!
        }
        else
        {
            var registration_confirmPasswordCell = tableView.dequeueReusableCell(withIdentifier: "registration_confirmPasswordCell")
            
            if (registration_confirmPasswordCell == nil)
            {
                registration_confirmPasswordCell = UITableViewCell(style: .default, reuseIdentifier: "registration_confirmPasswordCell")
            }
            
            confirmPasswordTF = registration_confirmPasswordCell?.viewWithTag(4445) as? UITextField
            
            return registration_confirmPasswordCell!
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
            passwordTF?.becomeFirstResponder()
        case 2:
            confirmPasswordTF?.becomeFirstResponder()
        default:
            break
        }
    }

    
    //MARK: - Button Actions

    @IBAction func createAccountAction(_ sender: UIButton) {
        
        self.view.endEditing(true)
//        print(TQHelper.sharedInstance.registrationInfoDict!)

        /*guard let password:String = TQHelper.sharedInstance.registrationInfoDict?[PASSWORD] as? String
            else
        {
            self.view.showToastWithMessage(BLANK_PASSWORD)
            return
        }
        
        guard let confirmPassword:String = TQHelper.sharedInstance.registrationInfoDict?[CONFIRM_PASSWORD] as? String
            else
        {
            self.view.showToastWithMessage(ENTER_VALID_PASSWORD)
            return
        }

        if (password.isBlank) {
            self.view.showToastWithMessage(BLANK_PASSWORD)
        } else if (confirmPassword.isBlank) {
            self.view.showToastWithMessage(ENTER_VALID_PASSWORD)
        } else if (password != confirmPassword) {
            self.view.showToastWithMessage(ENTER_VALID_PASSWORD)
        } else {*/
            
//            print(TQHelper.sharedInstance.registrationInfoDict!)
//            TQHelper.sharedInstance.registrationInfoDict = nil
        
            //API CALL THEN PUSH TO EITHER SUCCESS/FAILURE
            let registrationSuccessVC = mainStoryboard.instantiateViewController(withIdentifier: String(describing: TQRegistrationSuccessVC.self)) as! TQRegistrationSuccessVC
            
            TQNavigationHelper.sharedInstance.navigationController.pushViewController(registrationSuccessVC, animated: true)
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
        
        switch textField.tag {
        case 4444:
            passwordTF!.resignFirstResponder()
            confirmPasswordTF!.becomeFirstResponder()
            return true
            
        case 4445:
            passwordTF!.resignFirstResponder()
            self.createAccountBtn.sendActions(for: .touchUpInside)
            return true
        default:
            return false
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        print(TQHelper.sharedInstance.registrationInfoDict!)
        
        switch textField.tag {
        case 4444:
            TQHelper.sharedInstance.registrationInfoDict![PASSWORD] = textField.text as AnyObject
            return true
            
        case 4445:
            TQHelper.sharedInstance.registrationInfoDict![CONFIRM_PASSWORD] = textField.text as AnyObject
            return true
        default:
            return false
        }
    }*/
    
  /*  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        print(textField.text)
        
        switch textField.tag {
        case 4444:
            TQHelper.sharedInstance.registrationInfoDict![PASSWORD] = textField.text as AnyObject
            return true
            
        case 4445:
            TQHelper.sharedInstance.registrationInfoDict![CONFIRM_PASSWORD] = textField.text as AnyObject
            return true
        default:
            return false
        }
        
    }*/

}
