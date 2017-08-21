//
//  TQExistingUserListCellTableViewCell.swift
//  Trular
//
//  Created by Indusnet on 13/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQExistingUserListCell: TQBaseSwipeTableViewCell {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var dataLbl: UILabel!
    
    @IBOutlet weak var headerLbl: UILabel!

    @IBOutlet var separator: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        
        self.layoutSubviews()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.profileImg.layer.cornerRadius = self.profileImg.frame.height / 2
        self.profileImg.layer.masksToBounds = true
        
        
        
        
    }
    
    override var dataSource: AnyObject! {
        didSet {
            
            if let detailsdata  = dataSource["details"] as? String {
                self.dataLbl.text = detailsdata
            }
            
            if let detailsHeader  = dataSource["heading"] as? String {
                self.headerLbl.text = detailsHeader
            }
        }
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
