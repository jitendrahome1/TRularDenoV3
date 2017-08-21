//
//  TQForgotPasswordVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 30/05/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQForgotPasswordVC: TQBaseViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    
    @IBOutlet var continueBtnBottomConstraint: NSLayoutConstraint!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var sendBtn: UIButton!
    
    var emailTF:UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil);
        
        self.tableView.estimatedRowHeight = 113
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackWhite"), barTintColor: .clear, itemTintColor: .colorWithHexString("#404041"),isBarTranslucent: true)

        if let email:String = TQHelper.sharedInstance.loginInfoDict?[EMAIL] as? String
        {
            if !email.isBlank {
                TQHelper.sharedInstance.loginInfoDict?[EMAIL] = "" as AnyObject
            }
        }
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
        return 3
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
            var forgotPasswordEmailCell = tableView.dequeueReusableCell(withIdentifier: "forgotPasswordEmailCell")
            
            if (forgotPasswordEmailCell == nil)
            {
                forgotPasswordEmailCell = UITableViewCell(style: .default, reuseIdentifier: "forgotPasswordEmailCell")
            }
            
            emailTF = forgotPasswordEmailCell?.viewWithTag(7777) as? UITextField
            
            return forgotPasswordEmailCell!
            
        default:
            return blankCell!
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let cellHeight = tableView.frame.height / 3
        
        switch indexPath.row {
        case 0:
            return cellHeight
        case 1:
            return UITableViewAutomaticDimension
        case 2:
            return IS_IPAD() ? 113 : 93
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
    
    @IBAction func sendAction(_ sender: UIButton) {
        
        self.view.endEditing(true)
        /*print(TQHelper.sharedInstance.loginInfoDict!)
        
        guard let email:String = TQHelper.sharedInstance.loginInfoDict?[EMAIL] as? String
            else
        {
            self.view.showToastWithMessage(BLANK_EMAIL)
            return
        }
        
        if (email.isBlank) {
            self.view.showToastWithMessage(BLANK_EMAIL)
        } else if (!email.isValidEmail) {
            self.view.showToastWithMessage(ENTER_VALID_EMAILID)
        } else {*/
            
            //POP TO LANDING PAGE ON SUCCESS
            TQNavigationHelper.sharedInstance.navigationController.popToRootViewController(animated: false)
//        }
    }
    
    @IBAction func backAction(_ sender: Any) {
        
        TQNavigationHelper.sharedInstance.navigationController.popViewController(animated: true)
    }
    
    //MARK: - Textfield Delegates
    /*func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        switch textField.tag {
        case 7777:
            TQHelper.sharedInstance.loginInfoDict![EMAIL] = textField.text as AnyObject
            return true
            
        default:
            return false
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField.tag {
            
        case 7777:
            emailTF!.resignFirstResponder()
            self.sendBtn.sendActions(for: .touchUpInside)
            return true
        default:
            return false
        }
    }
*/
    
    /*func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        switch textField.tag {
        case 7777:
            TQHelper.sharedInstance.loginInfoDict![EMAIL] = textField.text as AnyObject
            return true
       
        default:
            return false
        }
    }*/

}
