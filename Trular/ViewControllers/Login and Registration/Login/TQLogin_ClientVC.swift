//
//  TQLogin_ClientVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 29/05/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQLogin_ClientVC: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {

    @IBOutlet var continueBtnBottomConstraint: NSLayoutConstraint!
    @IBOutlet var tableView: UITableView!

    var emailTF:UITextField?
    var passwordTF:UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil);
        
        self.tableView.estimatedRowHeight = 113
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
//        TQHelper.sharedInstance.loginInfoDict![EMAIL] = "testClient@clientWebsite.com" as AnyObject
//        TQHelper.sharedInstance.loginInfoDict![PASSWORD] = "testPassword" as AnyObject
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Tableiview Delegate & Datasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
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
            var login_ClientEmailCell = tableView.dequeueReusableCell(withIdentifier: "login_ClientEmailCell")
            
            if (login_ClientEmailCell == nil)
            {
                login_ClientEmailCell = UITableViewCell(style: .default, reuseIdentifier: "login_ClientEmailCell")
            }
            
            if let email = login_ClientEmailCell!.viewWithTag(5555) as? UITextField{
                emailTF = email
            }
            
            return login_ClientEmailCell!
            
        case 3:
            var login_ClientPasswordCell = tableView.dequeueReusableCell(withIdentifier: "login_ClientPasswordCell")
            
            if (login_ClientPasswordCell == nil)
            {
                login_ClientPasswordCell = UITableViewCell(style: .default, reuseIdentifier: "login_ClientPasswordCell")
            }
            
            if let password = login_ClientPasswordCell?.viewWithTag(5556) as? UITextField{
                passwordTF = password
            }
            
            return login_ClientPasswordCell!
            
        default:
            return blankCell!
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let cellHeight = tableView.frame.height / 4
        
        switch indexPath.row {
        case 0:
            return cellHeight
        case 1:
            return UITableViewAutomaticDimension
        case 2:
            return IS_IPAD() ? 113 : 93
        case 3:
            return IS_IPAD() ? 113 : 93
        /*case 4:
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
        
       /* guard let email:String = TQHelper.sharedInstance.loginInfoDict?[EMAIL] as? String
        else
        {
            self.view.showToastWithMessage(BLANK_EMAIL)
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
        } else if (!email.isValidEmail) {
            self.view.showToastWithMessage(ENTER_VALID_EMAILID)
        } else {*/
        
            //PUSH TO DASHBOARD ON SUCCESS
//            print(TQHelper.sharedInstance.loginInfoDict!)
//            TQHelper.sharedInstance.loginInfoDict = nil
        
            let containerVC = mainStoryboard.instantiateViewController(withIdentifier: String(describing: TQContainerVC.self)) as! TQContainerVC
            
            TQNavigationHelper.sharedInstance.navigationController.pushViewController(containerVC, animated: true)
//        }
    }
    
    //MARK: - Button Actions
    @IBAction func forgotPasswordAction(_ sender: UIButton) {
        
        let forgotPasswordVC = mainStoryboard.instantiateViewController(withIdentifier: String(describing: TQForgotPasswordVC.self)) as! TQForgotPasswordVC
        
        TQNavigationHelper.sharedInstance.navigationController.pushViewController(forgotPasswordVC, animated: true)
    }
    
    //MARK: - Textfield Delegates
    /*func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        switch textField.tag {
        case 5555:
            TQHelper.sharedInstance.loginInfoDict![EMAIL] = textField.text as AnyObject
            return true
            
        case 5556:
            TQHelper.sharedInstance.loginInfoDict![PASSWORD] = textField.text as AnyObject
            return true
        default:
            return false
        }
    }*/
    
    /*func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        print(emailTF!)
        
        switch textField.tag {
        case 5555:
            emailTF!.resignFirstResponder()
            passwordTF!.becomeFirstResponder()
            return true
            
        case 5556:
            passwordTF!.resignFirstResponder()
            return true
        default:
            return false
        }
    }*/

    /*func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        switch textField.tag {
        case 5555:
            TQHelper.sharedInstance.loginInfoDict![EMAIL] = textField.text as AnyObject
            return true
            
        case 5556:
            TQHelper.sharedInstance.loginInfoDict![PASSWORD] = textField.text as AnyObject
            return true
        default:
            return false
        }
    }*/
}
