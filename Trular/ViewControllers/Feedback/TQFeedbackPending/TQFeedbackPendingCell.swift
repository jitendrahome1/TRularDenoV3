//
//  TQFeedbackPendingCell.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 07/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQFeedbackPendingCell: TQBaseTableViewCell {
    
    @IBOutlet var profileImgVw: UIImageView!
    @IBOutlet var amountLbl: UILabel!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var statusBtn: UIButton!
    
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
        
        self.statusBtn.layer.cornerRadius = 2
        self.statusBtn.clipsToBounds = true        
    }
    
    override var dataSource: AnyObject! {
        didSet {
            
            self.profileImgVw.image = (dataSource["image"] as! UIImage)
            self.amountLbl.text = (dataSource["amount"] as! String)
            self.nameLbl.text = (dataSource["name"] as! String)
        }
    }
}
