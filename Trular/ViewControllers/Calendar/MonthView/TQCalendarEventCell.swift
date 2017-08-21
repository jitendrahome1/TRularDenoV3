//
//  TQCalendarEventCell.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 11/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQCalendarEventCell: TQBaseTableViewCell {
    
    @IBOutlet var inviteTypeStatusLbl: UILabel!
    @IBOutlet var inviteTypeLbl: UILabel!
    @IBOutlet var inviteDescriptionLbl: UILabel!
    
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

                self.inviteTypeLbl.text = invitationType
            }
            
            if let notifDetails = dataSource["notifDetails"] as? String {
                self.inviteDescriptionLbl.text = notifDetails
            }
        }
    }
}
