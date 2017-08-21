//
//  TQInviteByEmailVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 20/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQInviteByEmailVC: TQBaseViewController,UITableViewDelegate,UITableViewDataSource,UITextViewDelegate {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var sendBtn: UIButton!
    
    @IBOutlet var tableViewBottomConstraint: NSLayoutConstraint!

    var datasource:[String]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        datasource = ["NAME","E-MAIL"]
        self.tableView.estimatedRowHeight = 72
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.sendBtn.layer.cornerRadius = 2
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.hideNavigationBar = false
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackGray"), barTintColor: .white, itemTintColor: .lightGray,isBarTranslucent: false)
        
        self.setNavigationTitle(title: "Calendar", titleColor: .colorWithHexString("#404041"), subtitle: "Create an Event"+bulletUnicode+"Add/Edit invited users", subtitleColor: .lightGray)
        
        self.showSidePanel = false
        self.sendBtn.layer.cornerRadius = 2
        
        let center = NotificationCenter.default
        center.addObserver(self,
                           selector: #selector(keyboardWillShow(_:)),
                           name: .UIKeyboardWillShow,
                           object: nil)
        
        center.addObserver(self,
                           selector: #selector(keyboardWillHide(_:)),
                           name: .UIKeyboardWillHide,
                           object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        NotificationCenter.default.removeObserver(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- UITableView Delegate and Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let inviteByEmailFieldCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing:TQInviteByEmailFieldCell.self)) as! TQInviteByEmailFieldCell
        
        let textViewCell = self.tableView.dequeueReusableCell(withIdentifier: "TQInviteByEmailTextViewCell")
        
        if indexPath.row == 2 {
            return textViewCell!
        } else {
            inviteByEmailFieldCell.titleLbl.text = datasource[indexPath.row]
            return inviteByEmailFieldCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 2 {
            return UITableViewAutomaticDimension
        } else {
            return 72
        }
    }
    
    // MARK: UITextViewDelegate
    func textViewDidChange(_ textView: UITextView) {
        
        let currentOffset = tableView.contentOffset
        UIView.setAnimationsEnabled(false)
        tableView.beginUpdates()
        tableView.endUpdates()
        UIView.setAnimationsEnabled(true)
        tableView.setContentOffset(currentOffset, animated: false)
    }
    
    //MARK:- Button Actions
    @IBAction func sendAction(_ sender: UIButton) {
        TQNavigationHelper.sharedInstance.pushViewController(storyboard: quotesStoryboard, viewController: String(describing: TQInvitationSentVC.self))
    }
    
    //MARK:- Keyboard Notifications
    func keyboardWillShow(_ notification:NSNotification) {
        let userInfo:NSDictionary = notification.userInfo! as NSDictionary
        let keyboardFrame:NSValue = userInfo.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        
        tableViewBottomConstraint.constant = keyboardHeight - 80.0
    }
    
    func keyboardWillHide(_ notification:NSNotification) {
        
        tableViewBottomConstraint.constant = 0
    }
}
