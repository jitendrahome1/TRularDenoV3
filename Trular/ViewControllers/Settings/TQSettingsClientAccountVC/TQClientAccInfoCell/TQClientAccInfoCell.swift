//
//  TQMyAccountInfoCell.swift
//  Trular
//
//  Created by Indusnet on 08/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQClientAccInfoCell: TQBaseTableViewCell {
    
    
   
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var tfInfo: UITextField!
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
             
        
        
    }
    override var dataSource: AnyObject! {
        didSet {
            
           
            if let detailsdata  = dataSource["details"] as? String {
                self.tfInfo.text = detailsdata
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
