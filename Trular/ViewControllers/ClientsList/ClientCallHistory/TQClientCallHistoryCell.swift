//
//  TQClientCallHistoryCell.swift
//  Trular
//
//  Created by Jitendra on 6/13/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQClientCallHistoryCell: TQBaseTableViewCell {

    @IBOutlet weak var imgClient: UIImageView!
    @IBOutlet weak var lblClientTitle: UILabel!
    
    @IBOutlet weak var lblCallDurations: UILabel!
    @IBOutlet weak var imgCallStatus: UIImageView!
    @IBOutlet weak var viewBGOnline: UIView!
    @IBOutlet weak var viewOnlineStatus: UIView!
    @IBOutlet weak var btnCall: UIButton!
  
    @IBOutlet weak var btnVideo: UIButton!

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
    }
    
}
