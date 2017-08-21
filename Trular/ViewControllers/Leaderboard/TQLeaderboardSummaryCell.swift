//
//  TQLeaderboardSummaryCell.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 07/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQLeaderboardSummaryCell: TQBaseTableViewCell {
    
    @IBOutlet var summaryLbl: UILabel!
    @IBOutlet var valueLbl: UILabel!
    
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
    }
    
    override var dataSource: AnyObject! {
        didSet {
            
            self.summaryLbl.text = (dataSource["name"] as! String)
            self.valueLbl.text = (dataSource["value"] as! String)
        }
    }
}
