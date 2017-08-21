//
//  TQClientMessgeListCell.swift
//  Trular
//
//  Created by Jitendra on 6/13/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQClientMessgeListCell: TQBaseTableViewCell {

    @IBOutlet weak var lblClientTitle: UILabel!
    
    @IBOutlet weak var lblMessgeDisct: UILabel!
    @IBOutlet weak var viewBGOnline: UIView!
    @IBOutlet weak var viewOnlineStatus: UIView!
    @IBOutlet weak var imgClient: UIImageView!
  
    @IBOutlet weak var btnSigned: UIButton!

    override var dataSource: AnyObject! {
        didSet {
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imgClient.layer.cornerRadius = imgClient.frame.height/2
        imgClient.clipsToBounds = true
        viewBGOnline.layer.cornerRadius = viewBGOnline.frame.height/2
        viewOnlineStatus.layer.cornerRadius = viewOnlineStatus.frame.height/2
        btnSigned.layer.cornerRadius = 2        
    }

}
