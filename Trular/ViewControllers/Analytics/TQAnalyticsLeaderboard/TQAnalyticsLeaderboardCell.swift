//
//  TQAnalyticsLeaderboardCell.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 29/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQAnalyticsLeaderboardCell: TQBaseTableViewCell {

    @IBOutlet var rankLbl: UILabel!
    @IBOutlet var profileImgVw: UIImageView!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var emailLbl: UILabel!
    @IBOutlet var valueLbl: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override var dataSource: AnyObject! {
        didSet {
            
            self.rankLbl.text = (dataSource["rank"] as! String)
            self.nameLbl.text = (dataSource["name"] as! String)
            self.valueLbl.text = (dataSource["value"] as! String)
            self.emailLbl.text = (dataSource["email"] as! String)
        }
    }
}
