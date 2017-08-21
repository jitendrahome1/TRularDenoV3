//
//  TQTemplateFlowLayout.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 03/08/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQTemplateFlowLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupLayout() {
//        minimumLineSpacing = 20
//        minimumInteritemSpacing = 1
        scrollDirection = .vertical
    }
}
