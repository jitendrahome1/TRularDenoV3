//
//  TQProfileQuotesCell.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 15/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQProfileQuotesCell: TQBaseTableViewCell {
    
    @IBOutlet var amountLabel: UILabel!
    @IBOutlet var detailsLabel: UILabel!
    @IBOutlet var quoteActionButton: UIButton!
    @IBOutlet var profileImageView: UIImageView!
    
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
        
        profileImageView.layer.cornerRadius = 20
        profileImageView.clipsToBounds = true
        quoteActionButton.layer.cornerRadius = 2
    }
    
    override var dataSource: AnyObject! {
        didSet {
            
            if let amount = dataSource["amount"] as? String {
                self.amountLabel.text = amount
            }
            
            if let notifDetails = dataSource["notifDetails"] as? String {
                self.detailsLabel.text = notifDetails
            }
        }
    }
}
