//
//  TQInquiriesSettingsCell.swift
//  Trular
//
//  Created by Jitendra on 6/15/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQInquiriesSettingsCell: TQBaseTableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var btnSwitch: UIButton!
   
    
    override var dataSource: AnyObject! {
        didSet {
            lblTitle.text = dataSource! as? String
            
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        btnSwitch.setImage(#imageLiteral(resourceName: "green_switch"), for: .selected)
        btnSwitch.setImage(#imageLiteral(resourceName: "switchOff"), for: .normal)
    }
    
    @IBAction func switchAction(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5) {
            sender.isSelected = !sender.isSelected
        }
    }
}
