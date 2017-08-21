//
//  TQSelectTimezoneCell.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 18/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQSelectTimezoneCell: TQBaseTableViewCell {

    @IBOutlet weak var gmtLbl: UILabel!
    @IBOutlet weak var timezoneNameLbl: UILabel!
    @IBOutlet weak var switchBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        switchBtn.setImage(#imageLiteral(resourceName: "green_switch"), for: .selected)
        switchBtn.setImage(#imageLiteral(resourceName: "switchOff"), for: .normal)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override var dataSource: AnyObject! {
        didSet {
        }
    }
    
    @IBAction func switchAction(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5) {
            sender.isSelected = !sender.isSelected
        }
    }
}
