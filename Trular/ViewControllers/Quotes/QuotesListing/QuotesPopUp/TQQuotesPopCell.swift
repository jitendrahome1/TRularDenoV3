//
//  TQQuotesPopCell.swift
//  Trular
//
//  Created by Jitendra on 6/19/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQQuotesPopCell: TQBaseTableViewCell {

 
    @IBOutlet weak var imgQuotes: UIImageView!
  
    @IBOutlet weak var lblTitle: UILabel!

    @IBOutlet weak var lblStatsReport: UILabel!
    override var dataSource: AnyObject! {
        didSet {
        lblTitle.text = dataSource!["name"] as? String
        lblStatsReport.text = dataSource!["status"] as? String
        if lblStatsReport.text == "Confirmed"{
        lblStatsReport.textColor = .colorWithHexString("#91C569")
        
            }
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imgQuotes.layer.cornerRadius = imgQuotes.frame.height/2
        imgQuotes.clipsToBounds = true
        
    }
}
