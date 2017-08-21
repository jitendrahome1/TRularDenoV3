//
//  TQDashboardStatisticsVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 02/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQDashboardStatisticsVC: UIViewController,IndicatorInfoProvider {

    //MARK:- IBOutlets
    @IBOutlet var hitrateVw: UIView!
    
    @IBOutlet var arcView: UIView!
    @IBOutlet var percentageLbl: UILabel!
    
    @IBOutlet var sentQuotesBtn: UIButton!
    @IBOutlet var signedValueQuotesBtn: UIButton!
    @IBOutlet var signedAmountQuotesBtn: UIButton!
    @IBOutlet var hitrateQuotesBtn: UIButton!
    @IBOutlet var arcViewHeightConstraint: NSLayoutConstraint!
    
    //MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //        self.view.layoutIfNeeded()
        
        self.removeSublayers()
        
        if IS_IPHONE_4S() || IS_OF_4_INCH() {
            self.arcViewHeightConstraint.constant = self.arcView.frame.width
        } else {
            self.arcViewHeightConstraint.constant = self.arcView.frame.width * 1.3
        }
        
        self.arcView.layoutIfNeeded()
        drawArc(percentage: 99, color: UIColor.colorWithHexString("#008BFF"))
        setPercentageText(99)
        UISetup()
        addSelectedBorder(sender: sentQuotesBtn)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("viewDidLayoutSubviews")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- UISetup
    //Setup Corner Radius
    func UISetup() {
        
        self.sentQuotesBtn.layoutIfNeeded()
        self.sentQuotesBtn.layer.cornerRadius = self.sentQuotesBtn.frame.size.width / 2

        self.signedValueQuotesBtn.layoutIfNeeded()
        self.signedValueQuotesBtn.layer.cornerRadius = self.signedValueQuotesBtn.frame.size.width / 2
        
        self.signedAmountQuotesBtn.layoutIfNeeded()
        self.signedAmountQuotesBtn.layer.cornerRadius = self.signedAmountQuotesBtn.frame.size.width / 2

        self.hitrateQuotesBtn.layoutIfNeeded()
        self.hitrateQuotesBtn.layer.cornerRadius = self.hitrateQuotesBtn.frame.size.width / 2
    }
    
    //MARK:- Button Actions
    @IBAction func sentQuotesAction(_ sender: UIButton) {
        
        removeSublayers()
        addSelectedBorder(sender: sender)
        drawArc(percentage: 99,color:sender.backgroundColor!)
        setPercentageText(99)
    }
    
    @IBAction func signedValueQuotesAction(_ sender: UIButton) {
        
        removeSublayers()
        addSelectedBorder(sender: sender)
        drawArc(percentage: 45,color:sender.backgroundColor!)
        setPercentageText(45)
    }
    
    @IBAction func signedAmountQuotesAction(_ sender: UIButton) {
        
        removeSublayers()
        addSelectedBorder(sender: sender)
        drawArc(percentage: 80,color:sender.backgroundColor!)
        setPercentageText(80)
    }
    
    @IBAction func hitrateQuotesAction(_ sender: UIButton) {
        
        removeSublayers()
        addSelectedBorder(sender: sender)
        drawArc(percentage: 100,color:sender.backgroundColor!)
        setPercentageText(100)
    }
    
    //MARK:- Arc Drawing
    func drawArc(percentage: CGFloat,color:UIColor) {
        
        //Start point and end point
        let p1 = CGPoint.init(x:0, y: self.arcView.frame.height)
        let p2 = CGPoint.init(x:self.arcView.frame.width, y:0)
        
        //Midpoint and distance calculation
        let midpoint = CGPoint.init(x: (p1.x + p2.x) / 2, y: (p1.y + p2.y) / 2)
        let dist = p1.distance(toPoint: p2)
        
        //End Angle is changing because view's height is changing according to device
        var endAngleOffset = 4.0
        
        var width:CGFloat = 30.0
        
        if IS_IPHONE_4S() || IS_OF_4_INCH() {
            endAngleOffset = 14.0
            width = 25.0
        }
        
        let startAngleOffset = -13.0
        
        //Actual Shadow
        let arcShadowPath = UIBezierPath.init(arcCenter: midpoint, radius: (dist / 2) - 12.5, startAngle: CGFloat((132.5 + startAngleOffset) .degreesToRadians), endAngle: CGFloat((308 + endAngleOffset) .degreesToRadians), clockwise: true)
        
        let arcShadow = CAShapeLayer()
        arcShadow.path = arcShadowPath.cgPath
        arcShadow.fillColor = UIColor.white.cgColor
        arcShadow.strokeColor = UIColor.clear.cgColor
        arcShadow.lineWidth = 1.0
        arcShadow.lineCap = kCALineCapButt
        arcShadow.shadowColor = UIColor.colorWithHexString("#404041").cgColor
        arcShadow.shadowRadius = 7.0
        arcShadow.shadowOpacity = 0.7
        arcShadow.shadowOffset = CGSize.init(width: 0, height: 0)
        
        //A Cover to hide part of the shadow
        let arcShadowPathCover = UIBezierPath.init(arcCenter: midpoint, radius: (dist / 2) - 12.5, startAngle: CGFloat((0) .degreesToRadians), endAngle: CGFloat((360) .degreesToRadians), clockwise: true)
        
        let arcShadowCover = CAShapeLayer()
        arcShadowCover.path = arcShadowPathCover.cgPath
        arcShadowCover.fillColor = UIColor.white.cgColor
        arcShadowCover.strokeColor = UIColor.clear.cgColor
        arcShadowCover.lineWidth = 1.0
        
        //Actual arc
        let arcPath = UIBezierPath.init(arcCenter: midpoint, radius: dist / 2, startAngle: CGFloat((132.5 + startAngleOffset) .degreesToRadians), endAngle: CGFloat((308 + endAngleOffset) .degreesToRadians), clockwise: true)
        
        let arcShape = CAShapeLayer()
        arcShape.path = arcPath.cgPath
        arcShape.fillColor = UIColor.clear.cgColor
        arcShape.strokeColor = color.cgColor
        arcShape.lineWidth = width
        arcShape.lineCap = kCALineCapButt
        arcShape.strokeEnd = 0.0
        
        //Stroke End Animation
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        //Calculation of percentage. The offsets are given because of the excess angle offset.
        if percentage <= 0 {
            animation.toValue = percentage
        } else if percentage <= 4 {
            animation.toValue = 0.07
        } else if percentage <= 25 {
            animation.toValue = (percentage / 100) + 0.015
        } else if percentage <= 50 {
            animation.toValue = (percentage / 100) + 0.005
        } else if percentage <= 65 {
            animation.toValue = (percentage / 100) + 0.0025
        } else if percentage == 100 {
            animation.toValue = 1.0
        } else {
            animation.toValue = (percentage / 100) - (percentage / 2500)
        }
        
        //Animation settings
        animation.fromValue = 0.0
        animation.duration = 0.5
        animation.isRemovedOnCompletion = false
        animation.isAdditive = true
        animation.fillMode = kCAFillModeForwards
        
        //The order has to be maintained.
        self.arcView.layer.addSublayer(arcShape)
        arcShape.add(animation, forKey: "strokeEnd1")
        self.arcView.layer.addSublayer(arcShadow)
        self.arcView.layer.addSublayer(arcShadowCover)
    }
    
    //MARK:- Helper Methods
    //Distance between two points
    func distance(_ a: CGPoint, _ b: CGPoint) -> CGFloat {
        let xDist = a.x - b.x
        let yDist = a.y - b.y
        return CGFloat(sqrt((xDist * xDist) + (yDist * yDist)))
    }
    
    //Remove all sublayers
    func removeSublayers() {
        
        self.sentQuotesBtn.layer.sublayers?.last?.removeFromSuperlayer()
        self.signedValueQuotesBtn.layer.sublayers?.last?.removeFromSuperlayer()
        self.signedAmountQuotesBtn.layer.sublayers?.last?.removeFromSuperlayer()
        self.hitrateQuotesBtn.layer.sublayers?.last?.removeFromSuperlayer()
        self.arcView.layer.sublayers?.removeAll()
    }
    
    //Circular Border
    func addSelectedBorder(sender:UIButton) {
        
        let circularBorder = UIBezierPath()
        circularBorder.addArc(withCenter: CGPoint.init(x: sender.frame.width / 2, y: sender.frame.height / 2) , radius: sender.frame.width * 3 / 4, startAngle: CGFloat(Double.pi), endAngle: CGFloat(Double.pi * 4), clockwise: true)
        
        let circularBorderShape = CAShapeLayer()
        circularBorderShape.path = circularBorder.cgPath
        circularBorderShape.fillColor = UIColor.clear.cgColor
        circularBorderShape.strokeColor = sender.backgroundColor?.cgColor
        circularBorderShape.lineWidth = 1.0
        sender.layer.addSublayer(circularBorderShape)
    }
    
    //Set Percentage Text
    func setPercentageText(_ percentage:Int) {
        
        let percentAttr = NSMutableAttributedString(string: "%", attributes:[NSFontAttributeName: UIFont(name: BOLD_FONT_NAME, size: 25.0)!,NSForegroundColorAttributeName: UIColor.colorWithHexString("#A8ACBB")])
        
        var fontSize:CGFloat = 35.0
        if IS_IPHONE_4S() {
            fontSize = 35.0
        } else if IS_OF_4_INCH() {
            fontSize = 60.0
        } else {
            fontSize = 75.0
        }
        
        let percentNoAttr = NSMutableAttributedString(string: "\(percentage)", attributes: [NSFontAttributeName: UIFont(name: BOLD_FONT_NAME, size: fontSize)!,NSForegroundColorAttributeName: UIColor.colorWithHexString("#404041")])
        percentAttr.append(percentNoAttr)
        
        percentageLbl.attributedText = percentAttr
        self.arcView.bringSubview(toFront: self.percentageLbl)
        self.percentageLbl.sizeToFit()
    }
    
    //MARK:- Tab Pager Delegate
    //For Title
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo.init(title: "STATISTICS")
    }
}
