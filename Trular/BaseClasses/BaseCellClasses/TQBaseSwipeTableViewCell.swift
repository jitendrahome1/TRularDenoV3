//
//  TQBaseSwipeTableViewCell.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 14/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQBaseSwipeTableViewCell: MGSwipeTableCell {

    var dataSource: AnyObject!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
