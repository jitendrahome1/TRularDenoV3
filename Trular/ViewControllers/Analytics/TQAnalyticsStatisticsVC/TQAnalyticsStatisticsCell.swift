//
//  TQAnalyticsStatisticsCell.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 28/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQAnalyticsStatisticsCell: TQBaseTableViewCell {

    @IBOutlet var statisticsTypeLbl: UILabel!
    @IBOutlet var statisticsValueLbl: UILabel!
    @IBOutlet var currentPercentageLbl: UILabel!
    @IBOutlet var arcView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override var dataSource: AnyObject! {
        didSet {
            
            self.statisticsTypeLbl.text = (dataSource["type"] as! String)
            self.statisticsValueLbl.text = (dataSource["amount"] as! String)
            self.currentPercentageLbl.text = (dataSource["currentStatus"] as! String)
            
            self.arcView.layer.sublayers?.removeAll()
            self.drawArc(percentage: CGFloat((dataSource["percentage"] as! NSNumber).floatValue), goal: CGFloat((dataSource["goal"] as! NSNumber).floatValue), color: dataSource["color"] as! String)
        }
    }
    
    func drawArc(percentage:CGFloat,goal:CGFloat,color:String) {
        
        self.arcView.layer.sublayers?.removeAll()
        
        let startAngle = -(CGFloat.pi) / 2
        let endAngle = (3 * CGFloat.pi) / 2
        
        let arcPath = UIBezierPath.init(arcCenter: CGPoint.init(x: 20, y: 20), radius:20 , startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        let currentStateArc = CAShapeLayer()
        currentStateArc.path = arcPath.cgPath
        currentStateArc.fillColor = UIColor.clear.cgColor
        currentStateArc.strokeColor = UIColor.colorWithHexString(color).cgColor
        currentStateArc.lineWidth = 6.0
        currentStateArc.lineCap = kCALineCapButt
        currentStateArc.strokeEnd = 0.0
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = percentage / 100
        animation.fromValue = 0.0
        animation.duration = 1.2
        animation.isRemovedOnCompletion = false
        animation.isAdditive = true
        animation.fillMode = kCAFillModeForwards
        
        if goal > 0.0 {
            
            let goalArc = CAShapeLayer()
            goalArc.path = arcPath.cgPath
            goalArc.fillColor = UIColor.clear.cgColor
            goalArc.strokeColor = UIColor.colorWithHexString("#D9D9D9").cgColor
            goalArc.lineWidth = 6.0
            goalArc.lineCap = kCALineCapButt
            goalArc.strokeEnd = 0.0
            
            let goalAnimation = CABasicAnimation(keyPath: "strokeEnd")
            goalAnimation.toValue = goal / 100
            goalAnimation.fromValue = 0.0
            goalAnimation.duration = 1.2
            goalAnimation.isRemovedOnCompletion = false
            goalAnimation.isAdditive = true
            goalAnimation.fillMode = kCAFillModeForwards
            
            self.arcView.layer.addSublayer(goalArc)
            goalArc.add(goalAnimation, forKey: "strokeEnd2")
            
            self.arcView.layer.insertSublayer(currentStateArc, above: goalArc)
            currentStateArc.add(animation, forKey: "strokeEnd1")
        } else {
            self.arcView.layer.addSublayer(currentStateArc)
            currentStateArc.add(animation, forKey: "strokeEnd1")
        }
    }
}
