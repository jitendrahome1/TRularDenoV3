//
//  TQQuoteSignAndSaveVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 02/08/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQQuoteSignAndSaveVC: TQBasePagerVC {

    @IBOutlet var signAndSaveBtn: UIButton!
    @IBOutlet var btnSeparator: UILabel!
    
    @IBOutlet var btnView: UIView!
    
    override func viewDidLoad() {
        self.pagerShouldScroll = false
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        self.setupUI("0")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.hideNavigationBar = false
        self.showSidePanel = false
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackGray"), barTintColor: .white, itemTintColor: .lightGray,isBarTranslucent: false)
        
        self.setNavigationTitle(title: "Sign & Save", titleColor: .colorWithHexString("#404041"), subtitle: "ID: 546546", subtitleColor: .lightGray)
    }

    //MARK:- Pager UI
    func updatePagerUI(isBackgroundWhite:Bool) {
        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            
            guard changeCurrentIndex == true else { return }
            
            if isBackgroundWhite {
                
                oldCell?.label.textColor = .lightGray
                oldCell?.label.font = UIFont.init(name: MEDIUM_FONT_NAME, size: 12.0)
                oldCell?.separatorView.backgroundColor = .colorWithHexString("#dee5f0")
                newCell?.label.textColor = .colorWithHexString("#404041")
                newCell?.label.font = UIFont.init(name: MEDIUM_FONT_NAME, size: 12.0)
                newCell?.separatorView.backgroundColor = .colorWithHexString("#dee5f0")
                
            } else {
                
                oldCell?.label.textColor = UIColor.colorWithHexString("#B2D796")
                oldCell?.label.font = UIFont.init(name: MEDIUM_FONT_NAME, size: 12.0)
                oldCell?.separatorView.backgroundColor = .colorWithHexString("#B2D796")
                newCell?.label.textColor = UIColor.white
                newCell?.label.font = UIFont.init(name: MEDIUM_FONT_NAME, size: 12.0)
                newCell?.separatorView.backgroundColor = .colorWithHexString("#B2D796")
            }
        }
    }
    
    //MARK:- Update Button UI
    func updateOtherUI(isBackgroundWhite:Bool) {
        
        if isBackgroundWhite {
            
            self.signAndSaveBtn.backgroundColor = .colorWithHexString("#008bff")
            self.btnSeparator.backgroundColor = .colorWithHexString("#dee5f0")
            self.btnView.backgroundColor = .white
            
            self.signAndSaveBtn.setBackgroundImage(nil, for: .normal)
            
        } else {
            
            self.signAndSaveBtn.backgroundColor = .clear
            self.btnSeparator.backgroundColor = .clear
            self.btnView.backgroundColor = .colorWithHexString("#91c569")
            
            self.signAndSaveBtn.setBackgroundImage(#imageLiteral(resourceName: "ButtonBackground"), for: .normal)
        }
    }
    
    //MARK:- UI Setup
    func setupUI(_ index:String) {
        
        switch index {
        case "2":
            
            self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackWhite"), barTintColor: .colorWithHexString("#91C569"), itemTintColor: .white,isBarTranslucent: false)
            
            self.setNavigationTitle(title: "Sign & Save", titleColor: .white, subtitle: "ID: 546546", subtitleColor: .white)
            self.view.backgroundColor = .colorWithHexString("#91C569")
            self.buttonBarView.backgroundColor = .clear
            self.buttonBarView.selectedBar.backgroundColor = .white
            self.containerView.backgroundColor = .colorWithHexString("#91C569")
            self.updatePagerUI(isBackgroundWhite: false)
            self.buttonBarView.reloadData()

            self.updateOtherUI(isBackgroundWhite: false)
            break
            
        default:
            
            self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackGray"), barTintColor: .white, itemTintColor: .lightGray,isBarTranslucent: false)
            
            self.setNavigationTitle(title: "Sign & Save", titleColor: .colorWithHexString("#404041"), subtitle: "ID: 546546", subtitleColor: .lightGray)
            
            self.view.backgroundColor = .white
            self.buttonBarView.backgroundColor = .white
            self.buttonBarView.selectedBar.backgroundColor = .colorWithHexString("#404041")
            self.containerView.backgroundColor = .white
            self.updatePagerUI(isBackgroundWhite: true)
            self.buttonBarView.reloadData()

            self.updateOtherUI(isBackgroundWhite: true)
            break
        }
    }
    
    //MARK:- Pager Delegates
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController]  {
        
        let companySignature = quotesStoryboard.instantiateViewController(withIdentifier: String(describing: TQQuoteCompanySignVC.self)) as! TQQuoteCompanySignVC
        
        let clientSignature = quotesStoryboard.instantiateViewController(withIdentifier: String(describing: TQQuoteClientSignVC.self)) as! TQQuoteClientSignVC
        
        return [companySignature,clientSignature]
    }
    
    override func updateIndicator(for viewController: PagerTabStripViewController, fromIndex: Int, toIndex: Int, withProgressPercentage progressPercentage: CGFloat, indexWasChanged: Bool) {
        
        super.updateIndicator(for: viewController, fromIndex: fromIndex, toIndex: toIndex, withProgressPercentage: progressPercentage, indexWasChanged: indexWasChanged)
        
        if progressPercentage == 1.0 {
            setupUI("\(toIndex + 1)")
        }
    }
}
