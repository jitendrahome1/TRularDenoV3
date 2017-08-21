//
//  TQLogsCell.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 03/08/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQLogsCell: TQBaseTableViewCell {

    @IBOutlet var statusLbl: UILabel!
    @IBOutlet var animatorLine: UILabel!
    @IBOutlet var headerLbl: UILabel!
    @IBOutlet var dateLbl: UILabel!
    @IBOutlet var ownerDetails: UILabel!
    
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
        
        self.statusLbl.clipsToBounds = true
        self.statusLbl.layer.cornerRadius = 6
        
//        let highlightLayer = CAShapeLayer()
//        highlightLayer.path = UIBezierPath.init(arcCenter: self.statusLbl.center, radius: 14.0, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true).cgPath
//        highlightLayer.strokeColor = UIColor.colorWithHexString("#dee5f0").cgColor
//        highlightLayer.fillColor = UIColor.white.cgColor
//        
//        self.statusLbl.layer.addSublayer(highlightLayer)
    }
    override var dataSource: AnyObject! {
        didSet {

            self.headerLbl.text = (dataSource["headerTitle"] as! String)
            self.dateLbl.text = (dataSource["date"] as! String)
            self.ownerDetails.text = (dataSource["ownerDetails"] as! String)
            self.statusLbl.backgroundColor = UIColor.colorWithHexString("\(dataSource["statusColor"] as! String)")
        }
    }
}
