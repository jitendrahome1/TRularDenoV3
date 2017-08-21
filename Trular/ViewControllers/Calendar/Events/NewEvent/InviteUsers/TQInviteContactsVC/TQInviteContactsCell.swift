//
//  TQInviteContactsCell.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 20/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQInviteContactsCell: TQBaseTableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet var inviteBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override var dataSource: AnyObject! {
        didSet {
            
            //            self.nameLbl.text = dataSource as! String
            self.nameLbl.text = "\(dataSource["name"] as! String) \((dataSource["companyy"] as! String))"
            self.descLbl.text = "\((dataSource["email"] as! String))"
        }
    }
    
}
