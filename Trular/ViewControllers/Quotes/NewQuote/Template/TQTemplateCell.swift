//
//  TQTemplateCell.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 03/08/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQTemplateCell: TQBaseCollectionViewCell {
    
    @IBOutlet var textLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 2
    }
    
    override var dataSource: AnyObject! {
        didSet {
            self.textLbl.text = (dataSource as! String)
        }
    }
}
