//
//  TQClientAdminAccCell1.swift
//  Trular
//
//  Created by Indusnet on 08/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQSettinsMainCell1: TQBaseTableViewCell {
    
    
    @IBOutlet weak var usersProfileImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.usersProfileImg.layer.cornerRadius = self.usersProfileImg.frame.height / 2
        self.usersProfileImg.layer.masksToBounds = true
        
        
        

    }
    override var dataSource: AnyObject! {
        didSet {
            
                       
            
            
        }
    }
    

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
