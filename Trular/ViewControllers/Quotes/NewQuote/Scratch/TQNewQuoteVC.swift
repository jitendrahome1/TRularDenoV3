//
//  TQNewQuoteVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 01/08/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQNewQuoteVC: UIViewController,IndicatorInfoProvider,UIPageViewControllerDelegate,UIPageViewControllerDataSource {

    @IBOutlet var stepLbl: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var containerView: UIView!
    
    @IBOutlet var cancelBtn: UIButton!
    @IBOutlet var signAndSaveBtn: UIButton!
    @IBOutlet var previewAndSendBtn: UIButton!
    
    @IBOutlet var statusLbl: UIButton!
    
    @IBOutlet var dicsountBtn: UIButton!
    @IBOutlet var tagsBtn: UIButton!
    
    var pageViewController:UIPageViewController?
    
    var arr:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        arr = ["stepOneVC","stepTwoVC","stepThreeVC"]
        self.statusLbl.layer.cornerRadius = 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.setupUI()
    }

    
    //MARK:- Setup UI
    func setupUI() {
        self.cancelBtn.layer.cornerRadius = 2
        self.cancelBtn.layer.borderColor = UIColor.colorWithHexString("#DEE5F0").cgColor
        self.cancelBtn.layer.borderWidth = 0.5
        
        self.signAndSaveBtn.layer.cornerRadius = 2
        self.signAndSaveBtn.layer.borderColor = UIColor.colorWithHexString("#DEE5F0").cgColor
        self.signAndSaveBtn.layer.borderWidth = 0.5
        
        self.previewAndSendBtn.layer.cornerRadius = 2
        self.previewAndSendBtn.layer.borderColor = UIColor.colorWithHexString("#DEE5F0").cgColor
        self.previewAndSendBtn.layer.borderWidth = 0.5
    }
    
    //MARK:- UIPageViewController Delegate & Datasource
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! TQStepVC).index
        if index == 0 || index == NSNotFound {
            return nil
        }
        
        index -= 1
        
        return self.viewControllerForIndex(index)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! TQStepVC).index
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        
        if index == 2 {
            return nil
        }
        
        return self.viewControllerForIndex(index)
    }
    
    func viewControllerForIndex(_ index:Int) -> UIViewController {
        
        let stepVC = quotesStoryboard.instantiateViewController(withIdentifier: String(describing:TQStepVC.self)) as! TQStepVC
        stepVC.index = index
        return stepVC
    }
    
    //MARK:- Prepare For Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueToPageViewController" {
            
            self.pageViewController = segue.destination as? UIPageViewController
            self.pageViewController?.delegate = self
            self.pageViewController?.dataSource = self
            self.pageViewController?.setViewControllers([self.viewControllerForIndex(0)], direction: .forward, animated: false, completion: nil)
            self.pageViewController?.reloadInputViews()
        }
    }
    
    //MARK:- Button Actions
    
    @IBAction func cancelAction(_ sender: UIButton) {
        
        let cancelQuoteVC = quotesStoryboard.instantiateViewController(withIdentifier: String(describing:TQCancelQuoteVC.self))
        
        TQNavigationHelper.sharedInstance.contentMainNavVC.present(cancelQuoteVC, animated: true, completion: nil)
    }
    
    @IBAction func signAndSaveAction(_ sender: UIButton) {
        
        TQNavigationHelper.sharedInstance.pushViewController(storyboard: quotesStoryboard, viewController: String(describing:TQQuoteSignAndSaveVC.self))
    }
    
    @IBAction func previewAndSendAction(_ sender: UIButton) {
    }
    
    @IBAction func addEditTagsAction(_ sender: UIButton) {
        
        TQNavigationHelper.sharedInstance.pushViewController(storyboard: quotesStoryboard, viewController: String(describing:TQQuoteTagVC.self))
    }
    
    @IBAction func addDiscountAction(_ sender: UIButton) {
        
        TQNavigationHelper.sharedInstance.pushViewController(storyboard: quotesStoryboard, viewController: String(describing:TQQuoteDiscountVC.self))
    }
    
    
    //MARK:- Tab Pager Delegate
    //For Title
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        
        return IndicatorInfo.init(title: "QUOTE")
    }
    
}
