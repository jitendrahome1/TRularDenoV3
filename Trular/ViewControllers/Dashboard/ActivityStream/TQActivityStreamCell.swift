//
//  TQActivityStreamCell.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 07/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQActivityStreamCell: TQBaseTableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var detailsLabel: UILabel!
    @IBOutlet var unreadMsgCountLbl: UILabel!
    @IBOutlet var readMsgCountLbl: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var msgCountView: UIView!
    @IBOutlet var profileImageVw: UIView!
    
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
        msgCountView.layer.cornerRadius = 2
        msgCountView.layer.borderColor = UIColor.colorWithHexString("#a8acbb").cgColor
        msgCountView.layer.borderWidth = 0.5
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
            
            if let readCount = dataSource["readCount"] as? String {
                self.readMsgCountLbl.text = readCount
            }
            
            if let unreadCount = dataSource["unreadCount"] as? String {
                self.unreadMsgCountLbl.text = unreadCount
            }
        }
    }

}
