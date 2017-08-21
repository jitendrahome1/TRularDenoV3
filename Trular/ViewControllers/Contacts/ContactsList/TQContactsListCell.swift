//
//  TQClientsListCell.swift
//  Trular
//
//  Created by Jitendra on 6/12/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQContactsListCell: TQBaseSwipeTableViewCell {

    @IBOutlet weak var lblClientTitle: UILabel!
    @IBOutlet weak var lblClientEmail: UILabel!
   
    @IBOutlet weak var btnClientImg: UIButton!
    @IBOutlet weak var viewOnlineStatus: UIView!
    @IBOutlet weak var viewBGOnline: UIView!
    @IBOutlet weak var imgClient: UIImageView!

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
