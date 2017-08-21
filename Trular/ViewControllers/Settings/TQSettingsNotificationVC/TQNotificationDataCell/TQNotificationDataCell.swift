//
//  TQMyAccountSettingsNotificationDataCell.swift
//  Trular
//
//  Created by Indusnet on 09/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQNotificationDataCell: TQBaseTableViewCell {

    @IBOutlet weak var dataLbl: UILabel!
    @IBOutlet var separator: UIView!

  
    @IBOutlet weak var btnSwitch: UIButton!
    
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
                self.dataLbl.text = detailsdata
            }
            
           
            
            
//            if dataSource["Switch"] as? String == "YES" {
//                
//                self.btnSwitch.isHidden = false
//            }else{
//                
//                self.btnSwitch.isHidden = true
//                
//            }
//            
            
            
            
        }
    }
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
