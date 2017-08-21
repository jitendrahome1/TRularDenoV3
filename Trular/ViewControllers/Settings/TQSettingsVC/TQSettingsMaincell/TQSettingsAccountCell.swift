//
//  TQSettingsAccountCell.swift
//  Trular
//
//  Created by Indusnet on 08/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQSettingsAccountCell: TQBaseTableViewCell {

    @IBOutlet weak var profileImgVw: UIImageView!
    @IBOutlet var goldMemberBadge: UIImageView!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var detailsLbl: UILabel!
    
    @IBOutlet var goldMemberBadgeWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet var nameLblLeadingConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.profileImgVw.layer.cornerRadius = self.profileImgVw.frame.height / 2
        self.profileImgVw.layer.masksToBounds = true
      
    }
    override var dataSource: AnyObject! {
        didSet {
            
            self.nameLbl.text = (dataSource["name"] as! String)
            self.detailsLbl.text = (dataSource["details"] as! String)
            self.profileImgVw.image = UIImage.init(named: dataSource["profileImg"] as! String)
            
            if (dataSource["showGoldMemberBadge"] as! String) == "NO" {
                self.goldMemberBadge.isHidden = true
                self.goldMemberBadgeWidthConstraint.constant = 0
                self.nameLblLeadingConstraint.constant = 0
            } else {
                self.goldMemberBadge.isHidden = false
                self.goldMemberBadgeWidthConstraint.constant = 15
                self.nameLblLeadingConstraint.constant = 5
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
