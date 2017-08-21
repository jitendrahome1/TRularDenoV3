//
//  TQReceivedInvitationsCell.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 17/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQReceivedInvitationsCell: TQBaseSwipeTableViewCell {

    @IBOutlet var newInviteImgVw: UIImageView!
    @IBOutlet var inviteNameLbl: UILabel!
    @IBOutlet var inviteTypeStatusLbl: UILabel!
    @IBOutlet var inviteDescriptionLbl: UILabel!    
    @IBOutlet var quoteStatusBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        inviteTypeStatusLbl.layer.cornerRadius = 7.5
        inviteTypeStatusLbl.clipsToBounds = true
        inviteTypeStatusLbl.layer.borderWidth = 2.5
        quoteStatusBtn.layer.cornerRadius = 2
    }
    
    override var dataSource: AnyObject! {
        didSet {
            
            if let invitationType = dataSource["invitationType"] as? String {
                
                if invitationType == "Chat" {
                    inviteTypeStatusLbl.layer.borderColor = UIColor.colorWithHexString("#9d76c1").cgColor
                } else if invitationType == "Meeting" {
                    inviteTypeStatusLbl.layer.borderColor = UIColor.colorWithHexString("#91c569").cgColor
                } else if invitationType == "Call" {
                    inviteTypeStatusLbl.layer.borderColor = UIColor.colorWithHexString("#93c9ce").cgColor
                }
                
                self.inviteNameLbl.text = invitationType
            }
            
            if let notifDetails = dataSource["notifDetails"] as? String {
                self.inviteDescriptionLbl.text = notifDetails
            }
            
            if let invitationIsNew = dataSource["isNew"] as? String {
                
                if invitationIsNew == "1" {
                    self.newInviteImgVw.isHidden = false
                } else {
                    self.newInviteImgVw.isHidden = true
                }
            }
        }
    }
}
