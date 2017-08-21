//
//  TQClientAcceptCell.swift
//  Trular
//
//  Created by Jitendra on 6/13/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQClientAcceptCell: TQBaseTableViewCell {

    @IBOutlet weak var lblSectionTitle: UILabel!
    
    @IBOutlet weak var lblClientName: UILabel!

    @IBOutlet weak var lblCleintDescpt: UILabel!

    @IBOutlet weak var imgClient: UIImageView!

    @IBOutlet weak var lblClientRating: UILabel!

    @IBOutlet weak var btnClientFullProfile: UIButton!
    
    
    @IBAction func actionClientFullProfile(_ sender: UIButton) {
    }
  
    
    override var dataSource: AnyObject! {
        didSet {
             imgClient.layer.cornerRadius = imgClient.frame.height/2
            imgClient.clipsToBounds = true
            
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
      
        
    }
}
    

