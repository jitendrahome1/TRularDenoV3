//
//  TQLeaderboardUserCell.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 07/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQLeaderboardUserCell: TQBaseTableViewCell {
    
    @IBOutlet var rankLbl: UILabel!
    @IBOutlet var profileImgVw: UIImageView!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var emailLbl: UILabel!
    
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
            
            self.rankLbl.text = (dataSource["rank"] as! String)
            self.nameLbl.text = (dataSource["name"] as! String)
            self.emailLbl.text = (dataSource["email"] as! String)
        }
    }
}
