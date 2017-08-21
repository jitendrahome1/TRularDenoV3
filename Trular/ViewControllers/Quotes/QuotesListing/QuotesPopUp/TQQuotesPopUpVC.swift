//
//  TQQuotesPopUpVC.swift
//  Trular
//
//  Created by Jitendra on 6/19/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQQuotesPopUpVC: TQBaseViewController,UITableViewDataSource,UITableViewDelegate  {

    @IBOutlet weak var viewMainBG: UIView!
    @IBOutlet weak var aTableView: UITableView!
    var sectionsTitle  = [String]()
    var pDataItems = [AnyObject]()
    @IBOutlet weak var viewPop: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        sectionsTitle = ["CHANGE OWNER","ASSISTANT"]
     self.UISetup()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK:- UI Setup Function
    
    func UISetup(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(TQQuotesPopUpVC.tapDismissPopUp))
        self.viewMainBG.addGestureRecognizer(tapGesture)
    }
    
    
    
    //MARK:- Tableview Datasource and Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pDataItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let Cell : TQQuotesPopCell = self.aTableView.dequeueReusableCell(withIdentifier: "TQQuotesPopCell") as! TQQuotesPopCell
        Cell.dataSource = self.pDataItems[indexPath.row] as AnyObject
        
        
        return Cell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
          let headerTitle = self.pDataItems[section] as AnyObject
        return headerTitle["SectionTitle"] as? String
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }
    
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header = view as! UITableViewHeaderFooterView
        
        header.textLabel?.font = UIFont.init(name: BOLD_FONT_NAME, size: 10.0)
        header.textLabel?.textColor = UIColor.colorWithHexString("#a8acbb")
        
        
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.white
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
// MARK:- Pop up code 
// MARK:- This Function Show popup And Hide.
extension TQQuotesPopUpVC {
    internal class func showQuotesPopUp(_ sourceViewController: UIViewController, pArrValue:[AnyObject]?, didFinish: @escaping (() -> ())) {
        let quotesVCPopUp = quotesStoryboard.instantiateViewController(withIdentifier: String(describing: TQQuotesPopUpVC.self)) as! TQQuotesPopUpVC
        if let _ =  pArrValue{
           quotesVCPopUp.pDataItems = pArrValue!
        }
      
        quotesVCPopUp.presentAddOrClearPopUpWith(sourceViewController)
        
    }
    func presentAddOrClearPopUpWith(_ sourceController: UIViewController) {
        self.view.frame = sourceController.view.bounds
        sourceController.view.addSubview(self.view)
        sourceController.addChildViewController(self)
        self.aTableView.reloadData()
        sourceController.view.bringSubview(toFront: self.view)
        presentAnimationToView()
    }
    // MARK: - Animation
    func presentAnimationToView() {
        viewMainBG.alpha = 0.0
        self.viewPop.transform = CGAffineTransform(translationX: 0, y: SCREEN_HEIGHT)
        UIView.animate(withDuration: 0.25, animations: {
            self.viewMainBG.alpha = 0.2
            self.viewPop.transform = CGAffineTransform.identity
        })
        
    }
    // This is Used For dismiss
    func dismissAnimate() {
        UIView.animate(withDuration: 0.25, animations: {
            self.viewMainBG.alpha = 0.0
            self.viewPop.transform = CGAffineTransform(translationX: 0, y: SCREEN_HEIGHT)
        }, completion: { (true) in
            self.view.removeFromSuperview();
            self.removeFromParentViewController()
        })
    }
    func tapDismissPopUp(){
        self.dismissAnimate()
    }
    
}
