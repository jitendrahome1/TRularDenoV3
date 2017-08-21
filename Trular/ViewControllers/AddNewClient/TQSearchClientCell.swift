//
//  TQAddNewClientCell.swift
//  Trular
//
//  Created by Jitendra on 6/12/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQSearchClientCell: TQBaseTableViewCell {

    @IBOutlet weak var lblPlaceHolder: UILabel!
   
    @IBOutlet weak var lblTitleValue: UILabel!
    var shouldDisableLabels = false
    
    override var dataSource: AnyObject! {
        didSet {

            if shouldDisableLabels {
                if dataSource!["placeHolder"] as! String == "EMAIL" || dataSource!["placeHolder"] as! String == "PHONE"{
                    self.lblTitleValue.isUserInteractionEnabled = false
                    self.lblTitleValue.textColor = UIColor.colorWithHexString("#55A3FF")
                } else {
                    self.lblTitleValue.isUserInteractionEnabled = true
                    self.lblTitleValue.textColor = UIColor.white
                }
            }
            
            self.lblPlaceHolder.text = dataSource!["placeHolder"] as? String
            self.lblTitleValue.text = dataSource!["dataValue"] as? String
            
        }
    }
}
