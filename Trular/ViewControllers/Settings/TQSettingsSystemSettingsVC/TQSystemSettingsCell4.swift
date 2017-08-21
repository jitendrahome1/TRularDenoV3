//
//  TQSystemSettingsCell4.swift
//  Trular
//
//  Created by Indusnet on 15/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQSystemSettingsCell4: TQBaseTableViewCell {

    @IBOutlet var calendarIcon: UIImageView!
    @IBOutlet var calendarIcon2: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.calendarIcon.image = #imageLiteral(resourceName: "calendar").withRenderingMode(.alwaysTemplate)
        self.calendarIcon.tintColor = .colorWithHexString("#008BFF")
        
        self.calendarIcon2.image = #imageLiteral(resourceName: "calendar").withRenderingMode(.alwaysTemplate)
        self.calendarIcon2.tintColor = .colorWithHexString("#008BFF")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
