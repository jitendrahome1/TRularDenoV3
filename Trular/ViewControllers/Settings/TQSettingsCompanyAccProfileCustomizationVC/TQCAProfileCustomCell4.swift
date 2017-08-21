//
//  TQCAProfileCustomCell4.swift
//  Trular
//
//  Created by Indusnet on 15/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQCAProfileCustomCell4: TQBaseTableViewCell {
    
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet var separator: UIView!
    
    
    @IBOutlet weak var dataLbl: UILabel!
    
    
    @IBOutlet weak var sliderColor: UISlider!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override var dataSource: AnyObject! {
        didSet {
            
            if let detailsdata  = dataSource["details"] as? String {
                self.dataLbl.text = detailsdata
            }
            
            if let detailsHeader  = dataSource["heading"] as? String {
                self.headerLbl.text = detailsHeader
            }
            
            
            
            
            
            
            
        }
    }
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
