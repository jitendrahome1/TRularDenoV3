//
//  TQDashboardInquiriesCell.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 15/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQDashboardInquiriesCell: TQBaseTableViewCell {

    @IBOutlet var idLabel: UILabel!
    @IBOutlet var detailsLabel: UILabel!
    @IBOutlet var inquiryActionButton: UIButton!
    @IBOutlet var statusLabel: UILabel!
    
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
        
        statusLabel.layer.cornerRadius = 5
        statusLabel.clipsToBounds = true
        inquiryActionButton.layer.cornerRadius = 2
    }
    
    override var dataSource: AnyObject! {
        didSet {
            
            if let id = dataSource["id"] as? String {
                self.idLabel.text = id
            }
            
            if let notifDetails = dataSource["notifDetails"] as? String {
                self.detailsLabel.text = notifDetails
            }
        }
    }
}
