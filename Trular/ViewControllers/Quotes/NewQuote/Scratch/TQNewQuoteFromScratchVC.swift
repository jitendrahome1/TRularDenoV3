//
//  TQNewQuoteFromScratchVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 31/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQNewQuoteFromScratchVC: TQBasePagerVC {

    @IBOutlet var backBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.hideNavigationBar = true
        self.showSidePanel = false
        self.pagerShouldScroll = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Button Actions
    
    @IBAction func backAction(_ sender: UIButton) {
        
        guard let vc = TQNavigationHelper.sharedInstance.getViewControllerFromStack(String(describing:TQNewQuoteOptionVC.self)) else {
            return
        }
        
        TQNavigationHelper.sharedInstance.contentMainNavVC.popToViewController(vc, animated: true)
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let quoteVC = quotesStoryboard.instantiateViewController(withIdentifier: String(describing:TQNewQuoteVC.self))
        
        let templateVC = quotesStoryboard.instantiateViewController(withIdentifier: String(describing:TQQuoteTemplateVC.self))
        
        let notesVC = quotesStoryboard.instantiateViewController(withIdentifier: String(describing:TQQuoteNotesVC.self))
        
        let calendarVC = quotesStoryboard.instantiateViewController(withIdentifier: String(describing:TQNewQuoteCalendarVC.self))
        
        let logsVC = quotesStoryboard.instantiateViewController(withIdentifier: String(describing:TQQuoteLogsVC.self))
        
        let messagesVC = quotesStoryboard.instantiateViewController(withIdentifier: String(describing:TQQuoteMessagesVC.self))
        
        return [quoteVC,templateVC,notesVC,calendarVC,logsVC,messagesVC]
    }
}
