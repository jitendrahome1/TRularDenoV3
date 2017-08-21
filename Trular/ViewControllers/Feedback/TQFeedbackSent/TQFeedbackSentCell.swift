//
//  TQFeedbackSentCell.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 28/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQFeedbackSentCell: TQBaseTableViewCell {
    
    @IBOutlet var newFeedbackImageVw: UIImageView!
    @IBOutlet var feedbackImgVw: UIImageView!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var feedbackDetailsLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        
        self.layoutSubviews()
    }
    
    override var dataSource: AnyObject! {
        didSet {
            
            if let name = dataSource["name"] as? String, let company = dataSource["company"] as? String {
                
                let nameAttrString = NSMutableAttributedString(string: name + bulletUnicode, attributes:[NSFontAttributeName: UIFont.init(name: BOLD_FONT_NAME, size: 18.0)!])
                
                let companyAttrString = NSAttributedString(string: company, attributes:[NSFontAttributeName: UIFont.init(name: FONT_NAME, size: 18.0)!])
                
                nameAttrString.append(companyAttrString)
                
                self.nameLbl.attributedText = nameAttrString
            }
            
            self.feedbackDetailsLbl.text = dataSource["feedback"] as? String
            
            if dataSource["feedbackType"] as? String == "0" {
                self.feedbackImgVw.image = #imageLiteral(resourceName: "positiveGreen")
            } else {
                self.feedbackImgVw.image = #imageLiteral(resourceName: "negativeRed")
            }
            
            if dataSource["isNew"] as? String == "0" {
                self.newFeedbackImageVw.image = nil
            } else {
                self.newFeedbackImageVw.image = nil
            }
        }
    }
}
