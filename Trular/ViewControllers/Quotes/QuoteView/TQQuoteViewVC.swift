//
//  TQQuoteViewVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 21/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQQuoteViewVC: TQBasePagerVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.hideNavigationBar = false
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackWhite"), barTintColor: .clear, itemTintColor: .white,isBarTranslucent: true)
        
        self.setNavigationTitle(title: "ID: 3454778 "+bulletUnicode+" v 2.0", titleColor: .white, subtitle: "Date: 12/04/2017 "+bulletUnicode+"Due date: 18/04/2017", subtitleColor: .white)
        
        self.setRightBarButtonText(text: "Open", textColor: .white, backgroundColor: .colorWithHexString("#F48E1F"), showBorder: false, borderColor: .clear)

        self.extendedLayoutIncludesOpaqueBars = true
        self.edgesForExtendedLayout = .top
        self.showSidePanel = false
        self.barHeight = 0.5
        self.pagerShouldScroll = true
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let quoteSummary = quotesStoryboard.instantiateViewController(withIdentifier: String(describing:TQQuoteViewSummaryVC.self)) as! TQQuoteViewSummaryVC
        
        let messages = messagesStoryboard.instantiateViewController(withIdentifier: String(describing:TQMessagesListVC.self)) as! TQMessagesListVC
        
        let requestSchedule = quotesStoryboard.instantiateViewController(withIdentifier: String(describing:TQQuoteViewScheduleVC.self)) as! TQQuoteViewScheduleVC
        
        let fullQuote = mainStoryboard.instantiateViewController(withIdentifier: String(describing:TQUnderConstructionVC.self)) as! TQUnderConstructionVC
        
        let quoteForward = quotesStoryboard.instantiateViewController(withIdentifier: String(describing:TQQuoteForwardVC.self)) as! TQQuoteForwardVC
        
        let versionHistory = quotesStoryboard.instantiateViewController(withIdentifier: String(describing:TQQuoteViewVersionsVC.self)) as! TQQuoteViewVersionsVC
        
        let comments = quotesStoryboard.instantiateViewController(withIdentifier: String(describing:TQQuoteViewComments.self)) as! TQQuoteViewComments
        
        return [quoteSummary,messages,requestSchedule,fullQuote,quoteForward,versionHistory,comments]
    }
}
