//
//  TQClientAddedListCell.swift
//  Trular
//
//  Created by Jitendra on 6/14/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQClientAddedListCell: TQBaseTableViewCell {

    @IBOutlet weak var lblClientTitle: UILabel!
    @IBOutlet weak var lblClientEmail: UILabel!
 @IBOutlet weak var imgClient: UIImageView!
    override var dataSource: AnyObject! {
        didSet {
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imgClient.layer.cornerRadius = imgClient.frame.height/2
        imgClient.clipsToBounds = true
       

}
}
