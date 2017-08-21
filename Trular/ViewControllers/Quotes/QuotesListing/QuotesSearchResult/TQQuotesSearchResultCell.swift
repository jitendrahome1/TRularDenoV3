//
//  TQQuotesSearchResultCell.swift
//  Trular
//
//  Created by Jitendra on 6/19/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQQuotesSearchResultCell: TQBaseTableViewCell {

    @IBOutlet weak var btnQuotesStatus: UIButton!
    @IBOutlet weak var imgQuotes: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblStatusID: UILabel!
    
    
    override var dataSource: AnyObject! {
        didSet {
            
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imgQuotes.layer.cornerRadius = imgQuotes.frame.height/2
        imgQuotes.clipsToBounds = true
        
    }
    
}
