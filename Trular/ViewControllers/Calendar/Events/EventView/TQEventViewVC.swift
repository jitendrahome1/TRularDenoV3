//
//  TQEventViewVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 17/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQEventViewVC: TQBaseTableViewController {

    @IBOutlet weak var eventTypeLbl: UILabel!
    
    @IBOutlet weak var acceptBtn: UIButton!
    @IBOutlet weak var refuseBtn: UIButton!
    
    @IBOutlet weak var addUserBtn: UIButton!
    @IBOutlet weak var removeUserBtn: UIButton!
    
    @IBOutlet weak var quoteStatusBtn: UIButton!
    
    @IBOutlet weak var acceptBtnWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var refuseBtnWidthConstraint: NSLayoutConstraint!
    
    var invitationSource:InvitationSource = .sent
    
    var isAcceptExpanded = false , isRefuseExpanded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // Do any additional setup after loading the view.
        
        self.showSidePanel = true
        self.hideNavigationBar = false
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackGray"), barTintColor: .white, itemTintColor: .lightGray,isBarTranslucent: false)
        
        self.setNavigationTitle(title: "Calendar", titleColor: .colorWithHexString("#404041"), subtitle: "Company"+bulletUnicode+"Stockholm", subtitleColor: .lightGray)
        
        self.setNotificationBtn(notificationCount: 0)
    }
    //MARK:- Initial Setup
    func setupUI() {
        self.tableView.estimatedRowHeight = 72
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        eventTypeLbl.layer.cornerRadius = 7.5
        eventTypeLbl.clipsToBounds = true
        eventTypeLbl.layer.borderWidth = 2.5
        eventTypeLbl.layer.borderColor = UIColor.colorWithHexString("#91c569").cgColor
        
        self.quoteStatusBtn.layer.cornerRadius = 2
        
        if self.invitationSource == .received {
            self.acceptBtnWidthConstraint.constant = 50
            self.refuseBtnWidthConstraint.constant = 50
            self.acceptBtn.isHidden = false
            self.acceptBtn.isUserInteractionEnabled = true
        } else {
            self.acceptBtnWidthConstraint.constant = 50
            self.refuseBtnWidthConstraint.constant = 50
            self.acceptBtn.isHidden = true
            self.acceptBtn.isUserInteractionEnabled = false
        }
        
        self.acceptBtn.layer.cornerRadius = 2
        self.refuseBtn.layer.cornerRadius = 2
        
        acceptBtn.setImage(#imageLiteral(resourceName: "assignBold").withRenderingMode(.alwaysTemplate), for: .normal)
        acceptBtn.tintColor = .white
        
        refuseBtn.setImage(#imageLiteral(resourceName: "close_only_clients").withRenderingMode(.alwaysTemplate), for: .normal)
        refuseBtn.tintColor = .white
        
        addUserBtn.setImage(#imageLiteral(resourceName: "assignBold").withRenderingMode(.alwaysTemplate), for: .normal)
        addUserBtn.tintColor = .colorWithHexString("#91c569")
        
        removeUserBtn.setImage(#imageLiteral(resourceName: "close_only_clients").withRenderingMode(.alwaysTemplate), for: .normal)
        removeUserBtn.tintColor = .colorWithHexString("#E42825")
    }
    
    
    //MARK:- Button Actions
    @IBAction func acceptInvitationAction(_ sender: UIButton) {
        
        if isAcceptExpanded {
            self.acceptBtnWidthConstraint.constant = 50
            sender.setTitle("", for: .normal)
            sender.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
            sender.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            
            self.isAcceptExpanded = false
        } else {
            sender.setTitle("Accept Invitation?", for: .normal)
            sender.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: 8, bottom: 0, right: 0)
            sender.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 8)
            self.acceptBtnWidthConstraint.constant = 200
            
            UIView.animate(withDuration: 0.3, animations: { 
                self.view.layoutIfNeeded()
            })
            
            self.isAcceptExpanded = true
        }
    }
    
    @IBAction func refuseInviteAction(_ sender: UIButton) {
        
        if isRefuseExpanded {
            self.refuseBtnWidthConstraint.constant = 50
            sender.setTitle("", for: .normal)
            sender.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
            sender.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            
            self.isRefuseExpanded = false
        } else {
            self.refuseBtnWidthConstraint.constant = 200
            sender.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: 8, bottom: 0, right: 0)
            sender.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 8)
            sender.setTitle("Cancel Invitation?", for: .normal)
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            
            self.isRefuseExpanded = true
        }
    }
    
    //MARK:- UITableView Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return UITableViewAutomaticDimension
        case 1:
            return 72.0
        case 2:
            return 82.0
        case 3:
            return 101.0
        case 4:
            return 101.0
        case 5:
            return 82.0
        case 6:
            return UITableViewAutomaticDimension
        case 7:
            return 91
        default:
            return UITableViewAutomaticDimension
        }
    }
}
