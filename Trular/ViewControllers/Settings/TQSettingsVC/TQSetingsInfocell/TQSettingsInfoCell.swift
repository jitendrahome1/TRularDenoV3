//
//  TQClientAdminInfoCell.swift
//  Trular
//
//  Created by Indusnet on 08/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQSettingsInfoCell: TQBaseTableViewCell {
    
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var dataLabel: UILabel!
    
    
    @IBOutlet weak var separatorEndLineView: UIView!
    
    
    override func awakeFromNib() {
        
        
        super.awakeFromNib()
        // Initialization code
    }
    
    override var dataSource: AnyObject! {
        didSet {
            
            if let detailsdata  = dataSource["details"] as? String {
                
                self.dataLabel.text = detailsdata
            }

            if let detailsHeader  = dataSource["heading"] as? String {
                
                self.headerLabel.text = detailsHeader
            }
        }
    }
    


    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
