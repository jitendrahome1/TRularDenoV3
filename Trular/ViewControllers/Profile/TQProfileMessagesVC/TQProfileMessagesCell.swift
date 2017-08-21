//
//  TQProfileMessagesCell.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 15/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQProfileMessagesCell: TQBaseTableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var detailsLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var profileImageVw: UIView!
    @IBOutlet var messageActionBtn: UIButton!
    
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
        messageActionBtn.layer.cornerRadius = 2
    }
    
    override var dataSource: AnyObject! {
        didSet {
            
            if let name = dataSource["name"] as? String, let company = dataSource["company"] as? String {
                
                let nameAttrString = NSMutableAttributedString(string: name, attributes:[NSFontAttributeName: UIFont.systemFont(ofSize: 17, weight: UIFontWeightSemibold)])
                
                let companyAttrString = NSAttributedString(string: company, attributes:[NSFontAttributeName: UIFont.systemFont(ofSize: 17, weight: UIFontWeightRegular)])
                
                nameAttrString.append(companyAttrString)
                
                self.nameLabel.attributedText = nameAttrString
            }
            
            if let notifDetails = dataSource["notifDetails"] as? String {
                self.detailsLabel.text = notifDetails
            }
        }
    }
    
}
