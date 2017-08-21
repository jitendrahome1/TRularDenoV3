//
//  TQClientSettingCell.swift
//  Trular
//
//  Created by Jitendra on 6/14/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQClientSettingCell: TQBaseTableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnSwicth: UISwitch!
   
    override var dataSource: AnyObject! {
        didSet {
        lblTitle.text = dataSource! as? String
        
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
       
    }
}
