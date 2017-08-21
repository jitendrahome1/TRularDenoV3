//
//  TQQuoteClientSignVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 02/08/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import ACEDrawingView

class TQQuoteClientSignVC: UIViewController,IndicatorInfoProvider,ACEDrawingViewDelegate {

    @IBOutlet var drawingView: ACEDrawingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.drawingView.lineWidth = 5
        self.drawingView.drawTool = ACEDrawingToolTypePen
        self.drawingView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Tab Pager Delegate
    //For Title
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        
        return IndicatorInfo.init(title: "CLIENT")
    }

}
