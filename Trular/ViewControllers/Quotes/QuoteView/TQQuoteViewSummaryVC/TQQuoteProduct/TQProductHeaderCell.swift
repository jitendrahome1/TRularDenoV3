//
//  TQProductHeaderCell.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 22/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQProductHeaderCell: UITableViewCell {

    @IBOutlet var dueDateLbl: UILabel!
    @IBOutlet var locationLbl: UILabel!
    @IBOutlet var headerDetailsLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
