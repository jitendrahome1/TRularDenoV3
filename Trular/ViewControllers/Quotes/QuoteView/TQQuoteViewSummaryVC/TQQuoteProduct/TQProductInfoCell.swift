//
//  TQProductInfoCell.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 22/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQProductInfoCell: UITableViewCell {

    @IBOutlet var productImageVw: UIImageView!
    @IBOutlet var productHeadingLbl: UILabel!
    @IBOutlet var productDescLbl: UILabel!
    @IBOutlet var productPriceLbl: UILabel!
    @IBOutlet var productStatusImgVw: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
