//
//  TQMyAccountSettingsCell.swift
//  Trular
//
//  Created by Indusnet on 09/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQMyAccountSettingsCell: TQBaseTableViewCell {

    
    @IBOutlet weak var btnSwitch: UIButton!
   
    @IBOutlet weak var headerLbl: UILabel!
    
    @IBOutlet weak var tfData: UITextField!
    @IBOutlet weak var separatorEndLineView: UIView!
    
  
    
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
                
                if detailsdata == "quotes@spotify.trular.com" {
                    self.tfData.textColor = .colorWithHexString("#A8ACBB")
                } else if detailsdata == "spotify.trular.com" {
                    self.tfData.textColor = .colorWithHexString("#A8ACBB")
                } else {
                    self.tfData.textColor = .colorWithHexString("#404041")
                }
                
                self.tfData.text = detailsdata
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


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
