//
//  TQClientRecentListCell.swift
//  Trular
//
//  Created by Jitendra on 6/14/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQContactsRecentCell: TQBaseTableViewCell {

    @IBOutlet weak var ncConstLblLeading: NSLayoutConstraint!
    @IBOutlet weak var nsContImgWidth: NSLayoutConstraint!
    @IBOutlet weak var imgCallStatus: UIImageView!
    @IBOutlet weak var lblClientMessgeDisp: UILabel!
    @IBOutlet weak var lblClientTitle: UILabel!
    @IBOutlet weak var imgClient: UIImageView!
    
    @IBOutlet weak var viewOnlineStatus: UIView!
    @IBOutlet weak var viewBGOnline: UIView!
    @IBOutlet weak var btnSigned: UIButton!

    override var dataSource: AnyObject! {
        didSet {
        self.ncConstLblLeading.constant = 0.0
        self.nsContImgWidth.constant = 0.0
            
        self.lblClientTitle.text = dataSource!["clientName"] as? String
        self.imgClient.image = UIImage(named: dataSource!["clientImg"]as! String)
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
