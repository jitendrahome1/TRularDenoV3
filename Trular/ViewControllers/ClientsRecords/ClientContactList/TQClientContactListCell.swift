//
//  TQClientContactListCell.swift
//  Trular
//
//  Created by Jitendra on 6/13/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQClientContactListCell: TQBaseTableViewCell {
    @IBOutlet weak var lblClientTitle: UILabel!

    @IBOutlet weak var nsContImgWidth: NSLayoutConstraint!

    @IBOutlet weak var ncConstLeading: NSLayoutConstraint!
    @IBOutlet weak var lblClientSubTitle: UILabel!
    @IBOutlet weak var imgUpdateStatus: UIImageView!
    @IBOutlet weak var imgClient: UIImageView!
  
   
    override var dataSource: AnyObject! {
        didSet {
            self.nsContImgWidth.constant = 0.0
            self.ncConstLeading.constant = 0.0
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imgClient.layer.cornerRadius = imgClient.frame.height/2
        imgClient.clipsToBounds = true
        
    }
}
