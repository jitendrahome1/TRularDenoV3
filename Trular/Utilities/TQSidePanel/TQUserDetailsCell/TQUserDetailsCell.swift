//
//  TQUserDetailsCell.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 31/05/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQUserDetailsCell: TQBaseTableViewCell {

    @IBOutlet var userProfileImageView: UIImageView!
    @IBOutlet var onlineWhiteBackgroundView: UIView!
    @IBOutlet var onlineGreenBackgroundView: UIView!
    @IBOutlet var vendorClientSwitchBtn: UIButton!
    @IBOutlet var settingsBtn: UIButton!
    
    var switchUser : (() -> ())?
    var showUserSettings : (() -> ())?
    var showUserProfile : (() -> ())?
    
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
        
        self.userProfileImageView.layer.cornerRadius = self.userProfileImageView.frame.width / 2
        self.userProfileImageView.clipsToBounds = true
        
        self.onlineWhiteBackgroundView.layer.cornerRadius = self.onlineWhiteBackgroundView.frame.width / 2
        self.onlineGreenBackgroundView.layer.cornerRadius = self.onlineGreenBackgroundView.frame.width / 2
        
        self.vendorClientSwitchBtn.layer.cornerRadius = self.vendorClientSwitchBtn.frame.height / 2
    }
    
    @IBAction func switchUserTypeAction(_ sender: UIButton) {
        
        if self.switchUser != nil {
            
            self.switchUser!()
        }
    }
    
    @IBAction func userSettingsAction(_ sender: UIButton) {
        
        if self.showUserSettings != nil {
            
            self.showUserSettings!()
        }
    }
    
    @IBAction func userProfileAction(_ sender: UIButton) {
        
        if self.showUserProfile != nil {
            
            self.showUserProfile!()
        }
    }
}
