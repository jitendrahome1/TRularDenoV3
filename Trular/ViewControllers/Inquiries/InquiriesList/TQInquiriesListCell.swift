//
//  TQInquiriesListCell.swift
//  Trular
//
//  Created by Jitendra on 6/15/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQInquiriesListCell: TQBaseSwipeTableViewCell {

    
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var detailsLabel: UILabel!
    @IBOutlet var inquiryActionButton: UIButton!
    @IBOutlet var statusLabel: UILabel!

   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        statusLabel.layer.cornerRadius = 5
        statusLabel.clipsToBounds = true
        inquiryActionButton.layer.cornerRadius = 2
    }
    
    override var dataSource: AnyObject! {
        didSet {
            
            self.idLabel.text = dataSource["id"] as? String
            self.detailsLabel.text = dataSource["notifDetails"] as? String

            if dataSource["isNew"] as! String == "1" {
                statusLabel.isHidden = false
            } else {
                statusLabel.isHidden = true
            }
            
            let status = (dataSource["status"] as! String)
            self.inquiryActionButton.setTitle(status, for: .normal)

            self.inquiryActionButton.setTitleColor(UIColor.white, for: .normal)
            if status == "New" {
                self.inquiryActionButton.backgroundColor = UIColor.colorWithHexString("#5FD4FC")
            } else if status == "Assigned" {
                self.inquiryActionButton.backgroundColor = UIColor.colorWithHexString("#008BFF")
            } else if status == "Signed" {
                self.inquiryActionButton.backgroundColor = UIColor.colorWithHexString("#91c569")
            } else if status == "Finished" {
                self.inquiryActionButton.backgroundColor = UIColor.colorWithHexString("#EFF0F3")
                self.inquiryActionButton.setTitleColor(UIColor.colorWithHexString("#A8ACBB"), for: .normal)
            } else {
                self.inquiryActionButton.backgroundColor = UIColor.colorWithHexString("#F48E1F")
            }

        }
    }

}
