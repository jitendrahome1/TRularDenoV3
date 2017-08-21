//
//  TQEventTypeCell.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 18/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQEventTypeCell: TQBaseTableViewCell {

    @IBOutlet weak var inviteTypeStatusLbl: UILabel!
    @IBOutlet weak var inviteTypeNameLbl: UILabel!
    @IBOutlet weak var switchBtn: UIButton!
    
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
        switchBtn.setImage(#imageLiteral(resourceName: "green_switch"), for: .selected)
        switchBtn.setImage(#imageLiteral(resourceName: "switchOff"), for: .normal)
    }
    
    override var dataSource: AnyObject! {
        didSet {
            
            if let invitationType = dataSource["eventType"] as? String {
                
                if invitationType == "Chat" {
                    inviteTypeStatusLbl.layer.borderColor = UIColor.colorWithHexString("#9d76c1").cgColor
                } else if invitationType == "Meeting" {
                    inviteTypeStatusLbl.layer.borderColor = UIColor.colorWithHexString("#91c569").cgColor
                } else if invitationType == "Call" {
                    inviteTypeStatusLbl.layer.borderColor = UIColor.colorWithHexString("#93c9ce").cgColor
                }
                
                self.inviteTypeNameLbl.text = invitationType
            }
            
            
            if dataSource["isSelected"] as! String == "0" {
                self.switchBtn.isSelected = false
            } else {
                self.switchBtn.isSelected = true
            }
        }
    }
    
    @IBAction func switchAction(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5) {
            sender.isSelected = !sender.isSelected
        }
    }
}
