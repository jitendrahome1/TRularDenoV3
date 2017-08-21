//
//  TQQuoteLogsCell.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 03/08/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQQuoteLogsCell: TQBaseTableViewCell {

    @IBOutlet var headerLbl: UILabel!
    @IBOutlet var dateLbl: UILabel!
    @IBOutlet var ownerDetailsLbl: UILabel!
    @IBOutlet var animatorLine: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var statusView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.statusLabel.clipsToBounds = true
        self.statusLabel.layer.cornerRadius = 6
        self.statusView.layer.borderColor = UIColor.colorWithHexString("#dee5f0").cgColor
        self.statusView.layer.borderWidth = 0.5
        self.statusView.layer.cornerRadius = 10
    }

    
    override var dataSource: AnyObject! {
        didSet {
            
            self.headerLbl.text = (dataSource["headerTitle"] as! String)
            self.dateLbl.text = (dataSource["date"] as! String)
            self.ownerDetailsLbl.text = (dataSource["ownerDetails"] as! String)
            self.statusLabel.backgroundColor = UIColor.colorWithHexString("\(dataSource["statusColor"] as! String)")
        }
    }

}
