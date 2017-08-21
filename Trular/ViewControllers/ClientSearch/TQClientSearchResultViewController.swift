//
//  TQClientSearchResultViewController.swift
//  Trular
//
//  Created by Jitendra on 6/13/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQClientSearchResultViewController: TQBaseViewController {

    @IBOutlet weak var lblClientTitle: UILabel!
    
    @IBOutlet weak var lblClientSubTitle: UILabel!
    
    @IBOutlet weak var lblSearchResultvalue: UILabel!
    
    @IBOutlet weak var aProgressSearch: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let  searchResult = (lblSearchResultvalue.text?.components(separatedBy: "%")[0].toFloat())! / 100
        
        self.aProgressSearch.setProgress(1, animated: false)
        
        UIView.animate(withDuration: 1.0, animations: {
            self.aProgressSearch.layoutIfNeeded()
//            self.lblSearchResultvalue.text =  self.aProgressSearch.progress 
        }) { (finished) -> Void in
            
            if finished {
                TQNavigationHelper.sharedInstance.pushViewController(storyboard: userListStoryboard, viewController: String(describing: TQAddNewClientViewController.self))
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackWhite"), barTintColor: .colorWithHexString("#008BFF"), itemTintColor: .white,isBarTranslucent: true)
        
        self.lblSearchResultvalue.text = "100%"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
