//
//  TQSelectQuoteCell.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 19/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQSelectQuoteCell: TQBaseTableViewCell {

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
            
            let status = (dataSource["status"] as! String)
            
            self.amountLabel.text = (dataSource["amount"] as! String)
            self.detailsLabel.text = (dataSource["notifDetails"] as! String)
            self.quoteActionButton.setTitle(status, for: .normal)
            
            self.quoteActionButton.setTitleColor(UIColor.white, for: .normal)
            if status == "Open" {
                self.quoteActionButton.backgroundColor = UIColor.colorWithHexString("#F48E1F")
            } else if status == "Cancelled" {
                self.quoteActionButton.backgroundColor = UIColor.colorWithHexString("#E42825")
            } else if status == "Signed" {
                self.quoteActionButton.backgroundColor = UIColor.colorWithHexString("#91c569")
            } else if status == "Finished" {
                self.quoteActionButton.backgroundColor = UIColor.colorWithHexString("#EFF0F3")
                self.quoteActionButton.setTitleColor(UIColor.colorWithHexString("#A8ACBB"), for: .normal)
            } else {
                self.quoteActionButton.backgroundColor = UIColor.colorWithHexString("#F48E1F")
            }
        }
    }
}
