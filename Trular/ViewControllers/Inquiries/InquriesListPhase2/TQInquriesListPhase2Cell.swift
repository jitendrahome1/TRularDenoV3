//
//  TQInquriesListPhase2Cell.swift
//  Trular
//
//  Created by Jitendra on 6/15/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQInquriesListPhase2Cell: TQBaseSwipeTableViewCell {

    @IBOutlet var idLabel: UILabel!
    @IBOutlet var detailsLabel: UILabel!
    @IBOutlet var inquiryActionButton: UIButton!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
      
    }
    
    override var dataSource: AnyObject! {
        didSet {
         self.detailsLabel.text = dataSource["notifDetails"] as? String
        self.idLabel.text = dataSource["id"] as? String
            
        }
    
    }
    
}
