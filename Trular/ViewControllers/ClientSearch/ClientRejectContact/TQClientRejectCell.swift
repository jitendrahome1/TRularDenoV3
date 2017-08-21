//
//  TQClientRejectCell.swift
//  Trular
//
//  Created by Jitendra on 6/13/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQClientRejectCell: TQBaseTableViewCell {

    @IBOutlet weak var lblSectionTitle: UILabel!
    @IBOutlet weak var imgClient: UIImageView!
    
    @IBOutlet weak var lblClintTileName: UILabel!

    @IBOutlet weak var lblClientEmail: UILabel!

    @IBOutlet weak var lblRectDescription: UILabel!

    override var dataSource: AnyObject! {
        didSet {
             imgClient.layer.cornerRadius = imgClient.frame.height/2
            imgClient.clipsToBounds = true
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
    
        
    }
}
