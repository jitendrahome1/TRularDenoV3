//
//  TQCalendarMonthCell.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 12/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQCalendarMonthCell: TQBaseCollectionViewCell {
    
    @IBOutlet var monthNameLabel: UILabel!
    @IBOutlet var separatorLabel: UILabel!    
    
    override var dataSource: AnyObject! {
        didSet {
            
            self.monthNameLabel.text = (dataSource["monthName"] as! String)
        }
    }
}
