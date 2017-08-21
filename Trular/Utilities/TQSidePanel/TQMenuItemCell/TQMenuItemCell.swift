//
//  TQMenuItemCell.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 31/05/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQMenuItemCell: TQBaseTableViewCell {

      
    @IBOutlet var notificationCountLabel: UILabel!
    @IBOutlet var notificationCountLabelWidthConstraint: NSLayoutConstraint! // 40 When Shown, 0 when hidden
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var menuItemLabel: UILabel!
    
    var didSelect:(()->())?
    
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
        
        self.notificationCountLabel.layer.cornerRadius = self.notificationCountLabel.frame.height / 2
        self.notificationCountLabel.layer.masksToBounds = true
    }
   
    override var dataSource: AnyObject! {
        
        didSet {
            
            if (dataSource["badgeCount"] as! String == "0")
            {
                self.notificationCountLabel.isHidden = true
            }
            else
            {
                self.notificationCountLabel.isHidden = false
                self.notificationCountLabel.text = dataSource["badgeCount"] as? String
            }
            
            self.menuItemLabel.text = dataSource["name"] as? String
            self.menuItemLabel.textColor = UIColor.colorWithHexString((dataSource["fontColor"] as? String)!)
            self.iconImageView.image = UIImage.init(named: (dataSource["image"] as? String)!)
        }
    }
    
    @IBAction func didSelectAction(_ sender: UIButton) {
        
        if didSelect != nil {
            didSelect!()
        }
    }
}
