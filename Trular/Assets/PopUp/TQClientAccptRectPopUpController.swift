//
//  TQClientAccptRectPopUpController.swift
//  Trular
//
//  Created by Jitendra on 6/13/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQClientAccptRectPopUpController: TQBaseViewController {

    @IBOutlet weak var viewMainBg: UIView!
    
    @IBOutlet weak var btnPluse: UIButton!
    @IBOutlet weak var lblClientTitle: UILabel!
    
    @IBOutlet weak var lblClientSubTitle: UILabel!
    @IBOutlet weak var viewPopUpBG: UIView!
    
    @IBOutlet weak var btnAccept: UIButton!
    
    @IBOutlet weak var btnRefuse: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(TQClientAccptRectPopUpController.tapDismissPopUp))
        self.viewMainBg.addGestureRecognizer(tapGesture)
        self.UISetup()
        // Do any additional setup after loading the view.
    }

    // MARK:- UISetup
    func UISetup(){
      self.btnPluse.layer.cornerRadius = btnPluse.frame.width / 2
      self.btnAccept.layer.cornerRadius = 8.0
       self.btnRefuse.layer.cornerRadius = 6.0
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionAccept(_ sender: UIButton) {
        let acceptVC = userListStoryboard.instantiateViewController(withIdentifier: String(describing: TQClientAcceptContactController.self)) as! TQClientAcceptContactController
        self.navigationController?.pushViewController(acceptVC, animated: true)

    }
    
    @IBAction func actionRefuse(_ sender: UIButton) {
    let rejectVC = userListStoryboard.instantiateViewController(withIdentifier: String(describing: TQClientRejectResionController.self)) as! TQClientRejectResionController
        self.navigationController?.pushViewController(rejectVC, animated: true)
    
    }


}
// MARK:- This Function Show popup And Hide.
extension TQClientAccptRectPopUpController {
    internal class func showAccptRejtPopUp(_ sourceViewController: UIViewController, pDictValue:[String: AnyObject], didFinish: @escaping (() -> ())) {
        let clientVCPopUp = userListStoryboard.instantiateViewController(withIdentifier: String(describing: TQClientAccptRectPopUpController.self)) as! TQClientAccptRectPopUpController
        clientVCPopUp.presentAddOrClearPopUpWith(sourceViewController)
      
    }
    
    func presentAddOrClearPopUpWith(_ sourceController: UIViewController) {
        self.view.frame = sourceController.view.bounds
        sourceController.view.addSubview(self.view)
        sourceController.addChildViewController(self)
        sourceController.view.bringSubview(toFront: self.view)
        presentAnimationToView()
    }
    // MARK: - Animation
    func presentAnimationToView() {
        viewMainBg.alpha = 0.0
        self.viewPopUpBG.transform = CGAffineTransform(translationX: 0, y: SCREEN_HEIGHT)
        UIView.animate(withDuration: 0.25, animations: {
            self.viewMainBg.alpha = 0.4
            self.viewPopUpBG.transform = CGAffineTransform.identity
        })
        
    }
    
    // This is Used For dismiss
    func dismissAnimate() {
    UIView.animate(withDuration: 0.25, animations: {
            self.viewMainBg.alpha = 0.0
            self.viewPopUpBG.transform = CGAffineTransform(translationX: 0, y: SCREEN_HEIGHT)
        }, completion: { (true) in
            self.view.removeFromSuperview();
            self.removeFromParentViewController()
        })
    }
    
    func tapDismissPopUp(){
        self.dismissAnimate()
    }
    
}
