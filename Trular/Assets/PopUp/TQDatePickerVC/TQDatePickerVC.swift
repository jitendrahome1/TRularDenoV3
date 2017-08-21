//
//  TQDatePickerVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 18/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQDatePickerVC: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var containerVw: UIView!
    @IBOutlet var screenshotVw: UIView!
    
    
    var pickerSelected: ((_ value: AnyObject?) -> ())?
    var selectedValue: AnyObject!
    var isDatePicker = false
    var highlightedImg :UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.didTap(_:))))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal class func showPickerController(_ sourceViewController: UIViewController, isDatePicker: Bool, preSelected: String,highlightedImg:UIImage?,position:CGPoint?, selected: @escaping (_ value: AnyObject?) -> ()) {
        
        let viewController = otherStoryboard.instantiateViewController(withIdentifier: String(describing: TQDatePickerVC.self)) as! TQDatePickerVC
        viewController.pickerSelected = selected
        viewController.isDatePicker = isDatePicker
        viewController.presentPickerWith(sourceViewController, isDatePicker: isDatePicker, highlightedImg:highlightedImg, position:position, preSelected: preSelected)
    }

    func presentPickerWith(_ sourceController: UIViewController, isDatePicker: Bool, highlightedImg:UIImage?,position:CGPoint?, preSelected: String) {
        self.view.frame = UIScreen.main.bounds
        UIApplication.shared.windows.first!.addSubview(self.view)
        sourceController.addChildViewController(self)
        self.didMove(toParentViewController: sourceController)
        sourceController.view.bringSubview(toFront: self.view)
        
        self.datePicker.minimumDate = Date()
        
        if isDatePicker {
            self.datePicker.datePickerMode = .date
        } else {
            self.datePicker.datePickerMode = .time
        }
        
        self.highlightedImg = highlightedImg
        
        if highlightedImg != nil {
            
            let highlightedImgVw = UIImageView.init(image: highlightedImg)
            
            self.screenshotVw.addSubview(highlightedImgVw)
            highlightedImgVw.center = position!
        }
        
        getDatePickerDate()
        presentAnimationToView()
    }
    
    // MARK: - Animation
    func presentAnimationToView() {
        containerVw.transform = CGAffineTransform(translationX: 0, y: SCREEN_HEIGHT)
        UIView.animate(withDuration: 0.25, animations: {
            self.containerVw.transform = CGAffineTransform.identity
        }, completion: { (complete) in
        })
    }
    
    func dismissAnimate() {
        UIView.animate(withDuration: 0.25, animations: {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            self.containerVw.transform = CGAffineTransform(translationX: 0, y: SCREEN_HEIGHT)
        }, completion: { (true) in
            self.view.removeFromSuperview();
            self.removeFromParentViewController()
        }) 
    }
    
    //MARK:- Get Date/Time from DatePicker
    func getDatePickerDate() {
        
        if isDatePicker {
            selectedValue = datePicker.date.dateToStringWithCustomFormat("dd MMM yyyy") as AnyObject
        } else {
            selectedValue = datePicker.date.dateToStringWithCustomFormat("HH:mm a") as AnyObject
        }
    }
    
    //MARK:- UITapGestureRecognizer
    func didTap(_ gesture: UITapGestureRecognizer) {
        dismissAnimate()
    }
    
    //MARK:- DatePicker Value Changed
    
    @IBAction func datePickerValueDidChange(_ sender: UIDatePicker) {
        getDatePickerDate()
    }
    
    //MARK:- Button Actions
    @IBAction func doneAction(_ sender: UIButton) {
        
        pickerSelected!(selectedValue)
        dismissAnimate()
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        
        dismissAnimate()
    }
}
