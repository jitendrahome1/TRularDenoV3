//
//  TQProfileStatisticsCell.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 13/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQProfileStatisticsCell: TQBaseTableViewCell {

    @IBOutlet var statisticTypeLbl: UILabel!
    @IBOutlet var statisticValueLbl: UILabel!
    
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
            
            /*if let heading = dataSource["heading"] as? String {
                self.headingLbl.text = heading
            }
            
            if let details = dataSource["details"] as? String {
                self.detailsLbl.text = details
            }*/
        }
    }

}
