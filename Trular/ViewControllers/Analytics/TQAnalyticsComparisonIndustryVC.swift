//
//  TQAnalyticsComparisonIndustryVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 30/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TQAnalyticsComparisonIndustryVC: UIViewController,IndicatorInfoProvider {

    @IBOutlet var imgVw: UIImageView!
    @IBOutlet var arcView: UIView!
    @IBOutlet var arcViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet var arcViewHeightConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.arcViewHeightConstraint.constant = 225

        // Do any additional setup after loading the view.
        if IS_IPHONE_4S() {
            arcViewHeightConstraint.constant = 190
        } else if IS_OF_4_INCH() {
            arcViewHeightConstraint.constant = 198
        } else if IS_OF_5_INCH() {
            arcViewHeightConstraint.constant = 210
        } else if IS_OF_PLUS() {
            arcViewHeightConstraint.constant = 225
        } else {
            arcViewHeightConstraint.constant = 210
        }
        
        self.arcView.updateConstraints()
        self.view.updateConstraintsIfNeeded()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.imgVw.frame.size = CGSize(width: 59.0, height: 59.0)
        
        self.view.layoutIfNeeded()
        self.drawArc(0.60)
        self.view.setNeedsDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let dic = ["Controller":"3"]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: ANALYTICS_CHILD_NOTIFICATION), object: nil,userInfo:dic)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
    }
    
    //MARK:- Arc Drawing
    func drawArc(_ percentage:CGFloat) {
        
        //Start point and end point
        let p1 = CGPoint.init(x:0, y: self.arcView.frame.height)
        let p2 = CGPoint.init(x:self.arcView.frame.width, y:0)
        
        //Midpoint and distance calculation
        let midpoint = CGPoint.init(x: (p1.x + p2.x) / 2, y: (p1.y + p2.y) / 2)
        let dist = p1.distance(toPoint: p2)
        
        //End Angle is changing because view's height is changing according to device
        
        var width:CGFloat = 20.0
        var radius:CGFloat = dist / 2.5
        
        if IS_IPHONE_4S() || IS_OF_4_INCH() {
            width = 20.0
            radius  = dist / 2.8
        }
        
        let startAngle = CGFloat(2 * (Double.pi / 3))
        let pointAngle = (300 * percentage).degreesToRadians + startAngle
        
        var point = CGPoint.init(x: midpoint.x + radius * cos(pointAngle) , y: midpoint.y + radius * sin(pointAngle))
        point = self.arcView.convert(point, to: self.view)
        
        //Arc 1
        let arcPath1 = UIBezierPath.init(arcCenter: midpoint, radius: radius, startAngle: CGFloat(2 * (Double.pi / 3)), endAngle: CGFloat(Double.pi / 3), clockwise: true)
        
        let arcShape1 = CAShapeLayer()
        arcShape1.path = arcPath1.cgPath
        arcShape1.fillColor = UIColor.clear.cgColor
        arcShape1.strokeColor = UIColor.colorWithHexString("#008BFF").cgColor
        arcShape1.lineWidth = width
        arcShape1.lineCap = kCALineCapButt
        arcShape1.strokeEnd = 0.0
        
        //Stroke End Animation for arc 1
        let animation1 = CABasicAnimation(keyPath: "strokeEnd")
        
        //Animation settings
        animation1.fromValue = 0.0
        animation1.toValue = percentage
        animation1.duration = 0.3
        animation1.isRemovedOnCompletion = false
        animation1.isAdditive = true
        animation1.fillMode = kCAFillModeForwards
        
        //Arc 2
        let arcPath2 = UIBezierPath.init(arcCenter: midpoint, radius: radius, startAngle: CGFloat(2 * (Double.pi / 3)), endAngle: (CGFloat.pi / 3), clockwise: true)
        
        let arcShape2 = CAShapeLayer()
        arcShape2.path = arcPath2.cgPath
        arcShape2.fillColor = UIColor.clear.cgColor
        arcShape2.strokeColor = UIColor.colorWithHexString("#91C569").cgColor
        arcShape2.lineWidth = width
        arcShape2.lineCap = kCALineCapButt
        arcShape2.strokeEnd = 0.0
        
        //Stroke End Animation for arc 1
        let animation2 = CABasicAnimation(keyPath: "strokeEnd")
        
        //Animation settings
        animation2.fromValue = 0.0
        animation2.toValue = 1.0
        animation2.duration = 0.5
        animation2.isRemovedOnCompletion = false
        animation2.isAdditive = true
        animation2.fillMode = kCAFillModeForwards
        
        self.arcView.layer.sublayers?.removeAll()
        self.arcView.layer.addSublayer(arcShape2)
        self.arcView.layer.addSublayer(arcShape1)
        arcShape2.add(animation2, forKey: "strokeEnd2")
        arcShape1.add(animation1, forKey: "strokeEnd1")
        
        self.imgVw.center = point
        self.imgVw.setNeedsDisplay()
        UIView.animate(withDuration: 0.3) {
            self.view.bringSubview(toFront: self.imgVw)
        }
    }
 
    //MARK:- Tab Pager Delegate
    //For Title
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo.init(title: "COMPARISON INDUSTRY")
        
    }

}

