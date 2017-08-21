//
//  TQSettingsCAProfileHeaderCell.swift
//  Trular
//
//  Created by Indusnet on 14/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQSettingsProfileHeaderCell: TQBaseTableViewCell {

    
    @IBOutlet weak var dataLbl: UILabel!
    @IBOutlet weak var badgeImg: UIImageView!
    @IBOutlet weak var btnEdit: UIButton!
    
    @IBOutlet weak var mainImg: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    
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
        
        
        
        
    }
    override var dataSource: AnyObject! {
        didSet {
            
            
            
            
        }
    }


}
