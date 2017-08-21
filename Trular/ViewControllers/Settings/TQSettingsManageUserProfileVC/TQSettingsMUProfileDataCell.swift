//
//  TQSettingsMUProfileDataCell.swift
//  Trular
//
//  Created by Indusnet on 14/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQSettingsMUProfileDataCell: TQBaseTableViewCell {
    
    @IBOutlet weak var headerLbl: UILabel!
    
    @IBOutlet weak var btnSwitch: UIButton!
    
    @IBOutlet var separator: UIView!
    
    @IBOutlet weak var tfInfo: UITextField!
    
    

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
            
            if let detailsdata  = dataSource["details"] as? String {
                self.tfInfo.text = detailsdata
            }
            
            if let detailsHeader  = dataSource["heading"] as? String {
                self.headerLbl.text = detailsHeader
            }
            
            
            
            
            if dataSource["Switch"] as? String == "YES" {
                
                self.btnSwitch.isHidden = false
            }else{
                
                self.btnSwitch.isHidden = true
                
            }
 
            
            
            
        }
    }


}
