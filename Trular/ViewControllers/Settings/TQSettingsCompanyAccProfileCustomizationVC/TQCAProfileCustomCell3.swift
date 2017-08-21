//
//  TQCAProfileCustomCell3.swift
//  Trular
//
//  Created by Indusnet on 15/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQCAProfileCustomCell3: TQBaseTableViewCell {

    
    @IBOutlet weak var headerLbl: UILabel!
    
    @IBOutlet weak var btnColorPanel: UIButton!
    
    @IBOutlet weak var dataLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.btnColorPanel.layer.cornerRadius = self.btnColorPanel.frame.height / 2
        self.btnColorPanel.layer.masksToBounds = true
        
        
        
        
    }
    override var dataSource: AnyObject! {
        didSet {
            
//            if let detailsdata  = dataSource["details"] as? String {
//                self.dataLabel.text = detailsdata
//            }
//            
//            if let detailsHeader  = dataSource["heading"] as? String {
//                self.headerLabel.text = detailsHeader
//            }
//            
//            
//            
//            
//            if dataSource["showLine"] as? String == "NO" {
//                
//                self.separatorEndLineView.isHidden = false
//            }else{
//                
//                self.separatorEndLineView.isHidden = true
//                
//            }
//            
//            
            
            
            
        }
    }
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
