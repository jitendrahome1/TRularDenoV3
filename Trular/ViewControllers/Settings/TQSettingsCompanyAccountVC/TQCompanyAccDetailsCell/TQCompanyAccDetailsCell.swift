//
//  TQCompanyAccDetailsCell.swift
//  Trular
//
//  Created by Indusnet on 09/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQCompanyAccDetailsCell: TQBaseTableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        
        
    }
    override var dataSource: AnyObject! {
        didSet {
            
            
            if let detailsdata  = dataSource as? String {
                self.nameLbl.text = detailsdata
            }
          
            
        }
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
