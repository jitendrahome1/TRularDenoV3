//
//  TQFilterCell.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 28/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQFilterCell: TQBaseTableViewCell {
    
    @IBOutlet var filterNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setFilterDatasource(datasource:AnyObject,preSelected : String?) {
        
        if preSelected == nil {
            self.filterNameLbl.text = (datasource as! String)
        } else {
            if datasource as? String == preSelected {
                
                let selected = NSAttributedString.init(string: preSelected!, attributes: [NSForegroundColorAttributeName:UIColor.colorWithHexString("#404041")])
                self.filterNameLbl.attributedText = selected
                
            } else {
                self.filterNameLbl.text = datasource as? String
            }
        }
    }
    
}
