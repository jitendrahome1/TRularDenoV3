//
//  TQreportsBranchesCell.swift
//  Trular
//
//  Created by Indusnet on 28/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQreportsBranchesCell: TQBaseTableViewCell {
   
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var roundView: UIView!
    
    @IBOutlet weak var valueLbl: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.roundView.layer.cornerRadius = self.roundView.frame.height / 2
        self.roundView.layer.masksToBounds = true
        
        self.roundView.backgroundColor = .clear
        self.roundView.layer.borderWidth = 3
   
        
        
        
        
    }
    
    
    override var dataSource: AnyObject! {
        didSet {
            
            if let detailsdata  = dataSource["details"] as? String {
                self.valueLbl.text = detailsdata
            }
            
            if let detailsHeader  = dataSource["heading"] as? String {
                self.nameLbl.text = detailsHeader
            }
            
            if let detailColor  = dataSource["color"] as? String {
                self.roundView.layer.borderColor = UIColor.colorWithHexString(detailColor).cgColor
            }

            
            
            
            
            
            
        }
    }


}
