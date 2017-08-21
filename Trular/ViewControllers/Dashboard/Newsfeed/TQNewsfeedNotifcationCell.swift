//
//  TQNewsfeedNotifcationCell.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 07/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQNewsfeedNotifcationCell: TQBaseTableViewCell {

    @IBOutlet var idLabel: UILabel!
    @IBOutlet var notificationDetailsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        
        self.layoutSubviews()
    }
    
    override var dataSource: AnyObject! {
        didSet {
            
            if let id = dataSource["id"] as? String {
                self.idLabel.text = id
            }
            
            if let notifDetails = dataSource["notifDetails"] as? String {
                self.notificationDetailsLabel.text = notifDetails
            }
        }
    }

}
