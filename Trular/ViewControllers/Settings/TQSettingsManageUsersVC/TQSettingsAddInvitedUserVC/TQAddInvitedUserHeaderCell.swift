//
//  TQAddInvitedUserHeaderCell.swift
//  Trular
//
//  Created by Indusnet on 14/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQAddInvitedUserHeaderCell: TQBaseTableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        
        
    }
    
    override var dataSource: AnyObject! {
        didSet {
            
//            if let detailsdata  = dataSource["details"] as? String {
//                self.dataLbl.text = detailsdata
//            }
//            
//            if let detailsHeader  = dataSource["heading"] as? String {
//                self.headerLbl.text = detailsHeader
//            }
        }
    }
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
