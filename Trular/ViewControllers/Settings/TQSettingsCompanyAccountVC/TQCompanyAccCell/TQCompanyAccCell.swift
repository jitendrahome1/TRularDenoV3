//
//  TQCompanyAccCell.swift
//  Trular
//
//  Created by Indusnet on 09/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQCompanyAccCell: TQBaseTableViewCell {
    
    @IBOutlet weak var headerImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.headerImg.layer.cornerRadius = self.headerImg.frame.height / 2
        self.headerImg.layer.masksToBounds = true
        
        
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
