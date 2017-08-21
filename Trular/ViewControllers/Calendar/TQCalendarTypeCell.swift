//
//  TQCalendarTypeCell.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 12/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQCalendarTypeCell: TQBaseCollectionViewCell {
    
    @IBOutlet var typeNameLbl: UILabel!
    
    var selectedValue:String = ""
    
    override var dataSource: AnyObject! {
        didSet {
            
            var strFromType = " "
            
            switch dataSource as! CalendarType {
            case .DAY:
                strFromType = "DAY"
                break
            case .UPCOMING:
                strFromType = "UPCOMING"
                break
            case .MONTH:
                strFromType = "MONTH"
                break
            case .YEAR:
                strFromType = "YEAR"
                break
            case .WEEK:
                strFromType = "WEEK"
                break
            }
            
            self.typeNameLbl.text = strFromType
            
            if selectedValue.characters.count > 0 && selectedValue == strFromType {
                self.typeNameLbl.textColor = UIColor.colorWithHexString("#404041")
            } else {
                self.typeNameLbl.textColor = UIColor.colorWithHexString("#a8acbb")
            }
            
            if strFromType == "UPCOMING" {
                self.typeNameLbl.text = "7 DAYS"
            }
        }
    }

}
