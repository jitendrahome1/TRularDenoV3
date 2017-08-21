//
//  TQAddNewClientCell.swift
//  Trular
//
//  Created by Jitendra on 6/12/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQAddNewClientCell: TQBaseTableViewCell {

    @IBOutlet weak var lblClientTitle: UILabel!
   var didTapPluse: ((_ sender: UIButton) -> ())?
    @IBOutlet weak var lblClientEmail: UILabel!
    
    @IBOutlet weak var btnAddClient: UIButton!
    @IBOutlet weak var lblResultFound: UILabel!
    
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

    @IBAction func actionAddClient(_ sender: UIButton) {
        if (didTapPluse != nil) {
            didTapPluse!(sender)
        }

    
    }
}
