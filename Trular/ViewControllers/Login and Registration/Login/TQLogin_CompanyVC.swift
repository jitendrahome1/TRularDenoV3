//
//  TQLogin_CompanyVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 29/05/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQLogin_CompanyVC: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var continueBtnBottomConstraint: NSLayoutConstraint!

    var emailTF:UITextField?
    var nameTF:UITextField?
    var passwordTF:UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true
        self.tableView.estimatedRowHeight = 93
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil);
        
        self.tableView.estimatedRowHeight = 113
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var blankCell = tableView.dequeueReusableCell(withIdentifier: "blankCell")
        
        if (blankCell == nil)
        {
            blankCell = UITableViewCell(style: .default, reuseIdentifier: "blankCell")
        }
        
        switch indexPath.row {
        case 0:
            
            return blankCell!
            
        case 1:
            
            var login_textCell = tableView.dequeueReusableCell(withIdentifier: "login_textCell")
            
            if (login_textCell == nil)
            {
                login_textCell = UITableViewCell(style: .default, reuseIdentifier: "login_textCell")
            }
            
            return login_textCell!
            
            
        case 2:
            var login_CompanyEmailCell = tableView.dequeueReusableCell(withIdentifier: "login_CompanyEmailCell")
            
            if (login_CompanyEmailCell == nil)
            {
                login_CompanyEmailCell = UITableViewCell(style: .default, reuseIdentifier: "login_CompanyEmailCell")
            }
            
            emailTF = login_CompanyEmailCell?.viewWithTag(6666) as? UITextField
            
            return login_CompanyEmailCell!
            
        case 3:
            var login_CompanyNameCell = tableView.dequeueReusableCell(withIdentifier: "login_CompanyNameCell")
            
            if (login_CompanyNameCell == nil)
            {
                login_CompanyNameCell = UITableViewCell(style: .default, reuseIdentifier: "login_CompanyNameCell")
            }
            
            nameTF = login_CompanyNameCell?.viewWithTag(6667) as? UITextField
            
            return login_CompanyNameCell!
            
        case 4:
            var login_CompanyPasswordCell = tableView.dequeueReusableCell(withIdentifier: "login_CompanyPasswordCell")
            
            if (login_CompanyPasswordCell == nil)
            {
                login_CompanyPasswordCell = UITableViewCell(style: .default, reuseIdentifier: "login_CompanyPasswordCell")
            }
            
            passwordTF = login_CompanyPasswordCell?.viewWithTag(6668) as? UITextField
            
            return login_CompanyPasswordCell!
        
        default:
            return blankCell!
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let cellHeight = tableView.frame.height / 5
        
        switch indexPath.row {
        case 0:
            return cellHeight
        case 1:
            return UITableViewAutomaticDimension
        case 2:
            return IS_IPAD() ? 113 : 93
        case 3:
            return IS_IPAD() ? 113 : 93
        case 4:
            return IS_IPAD() ? 113 : 93
        /*case 5:
            return IS_IPAD() ? 60 : 45*/

        default:
            return cellHeight
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 2:
            emailTF?.becomeFirstResponder()
        case 3:
            nameTF?.becomeFirstResponder()
        case 4:
            passwordTF?.becomeFirstResponder()
        default:
            break
        }
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

    //MARK: - Button Actions
    
    @IBAction func loginAction(_ sender: UIButton) {
        
        self.view.endEditing(true)
//        print(TQHelper.sharedInstance.loginInfoDict!)
        
        /*guard let email:String = TQHelper.sharedInstance.loginInfoDict?[EMAIL] as? String
            else
        {
            self.view.showToastWithMessage(BLANK_EMAIL)
            return
        }
        
        guard let name:String = TQHelper.sharedInstance.loginInfoDict?[NAME] as? String
            else
        {
            self.view.showToastWithMessage(BLANK_NAME)
            return
        }
        
        guard let password:String = TQHelper.sharedInstance.loginInfoDict?[PASSWORD] as? String
            else
        {
            self.view.showToastWithMessage(BLANK_PASSWORD)
            return
        }

        if (email.isBlank) {
            self.view.showToastWithMessage(BLANK_EMAIL)
        } else if (password.isBlank) {
            self.view.showToastWithMessage(BLANK_PASSWORD)
        } else if (name.isBlank) {
            self.view.showToastWithMessage(BLANK_NAME)
        } else if (!email.isValidEmail) {
            self.view.showToastWithMessage(ENTER_VALID_EMAILID)
        } else {*/
            
            //PUSH TO DASHBOARD ON SUCCESS

//            print(TQHelper.sharedInstance.loginInfoDict!)
            TQHelper.sharedInstance.loginInfoDict = nil
            
            let containerVC = mainStoryboard.instantiateViewController(withIdentifier: String(describing: TQContainerVC.self)) as! TQContainerVC
        
            TQNavigationHelper.sharedInstance.navigationController.pushViewController(containerVC, animated: true)
//        }
    }

    
    @IBAction func forgotPasswordAction(_ sender: UIButton) {
        
        let forgotPasswordVC = mainStoryboard.instantiateViewController(withIdentifier: String(describing: TQForgotPasswordVC.self)) as! TQForgotPasswordVC
        
        TQNavigationHelper.sharedInstance.navigationController.pushViewController(forgotPasswordVC, animated: true)
    }
    
    //MARK: - Textfield Delegates
    /*func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        switch textField.tag {
        case 6666:
            TQHelper.sharedInstance.loginInfoDict![EMAIL] = textField.text as AnyObject
            return true
            
        case 6667:
            TQHelper.sharedInstance.loginInfoDict![NAME] = textField.text as AnyObject
            return true
            
        case 6668:
            TQHelper.sharedInstance.loginInfoDict![PASSWORD] = textField.text as AnyObject
            return true
        default:
            return false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField.tag {
        case 6666:
            emailTF!.resignFirstResponder()
            nameTF!.becomeFirstResponder()
            return true
            
        case 6667:
            nameTF!.resignFirstResponder()
            passwordTF!.becomeFirstResponder()
            return true
            
        case 6668:
            passwordTF!.resignFirstResponder()
            return true
        default:
            return false
        }
    }*/
    
    /*func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        switch textField.tag {
        case 6666:
            TQHelper.sharedInstance.loginInfoDict![EMAIL] = textField.text as AnyObject
            return true
            
        case 6667:
            TQHelper.sharedInstance.loginInfoDict![NAME] = textField.text as AnyObject
            return true
            
        case 6668:
            TQHelper.sharedInstance.loginInfoDict![PASSWORD] = textField.text as AnyObject
            return true
        default:
            return false
        }
    }*/
    
}
