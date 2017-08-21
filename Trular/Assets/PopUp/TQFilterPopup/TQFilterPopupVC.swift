//
//  TQFilterPopupVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 15/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

enum FilterPosition {
    case bottomLeft
    case bottomRight
    case freeform
}

enum FilterWidth {
    case regular
    case wide
}

class TQFilterPopupVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
//    @IBOutlet var tableViewHeightConstraint: NSLayoutConstraint!
    
    var filtersArray = [[String]]()
    
    var selectedFilters: ((_ value: AnyObject?, _ index: Int?) -> ())?
    var selectedValue: AnyObject!
    var selectedIndex: Int!
    var preSelectedValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer.init(target: self, action: #selector(self.didTap(recognizer:)))
        self.view.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal class func showFiltersWith(_ sourceViewController: UIViewController, filtersArray: [[String]], preSelected: String, position:FilterPosition,width:FilterWidth, center:CGPoint ,selected: @escaping (_ value: AnyObject?,_ index: Int?) -> ()) {
        if  filtersArray.count == 0 {
            sourceViewController.view.showToastWithMessage(NO_LISTING)
            return
        }
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: String(describing: TQFilterPopupVC.self)) as! TQFilterPopupVC
        viewController.selectedFilters = selected
        viewController.preSelectedValue = preSelected
        viewController.filtersArray = filtersArray
        
        var frame = CGRect()
        
        if filtersArray.count > 1 {
            let subArr1 = filtersArray[0]
            let subArr2 = filtersArray[1]
            
            frame = viewController.setupTableView(position: position, width: width, center: center, filterCount: subArr1.count + subArr2.count,sectionCount:2)
        } else {
            let subArr1 = filtersArray[0]
            frame = viewController.setupTableView(position: position, width: width, center: center, filterCount: subArr1.count,sectionCount:1)
        }
        
        viewController.presentFilterControllerWith(sourceViewController, filtersArray:filtersArray, filterFrame:frame)
    }
    
    func presentFilterControllerWith(_ sourceController: UIViewController, filtersArray: [[String]], filterFrame:CGRect) {
        
        self.view.frame = UIScreen.main.bounds
        UIApplication.shared.windows.first!.addSubview(self.view)
        sourceController.addChildViewController(self)
        self.didMove(toParentViewController: sourceController)
        sourceController.view.bringSubview(toFront: self.view)
        
        self.tableView.frame = filterFrame
        
        presentAnimationToView()
    }
    
    func setupTableView(position:FilterPosition,width:FilterWidth , center:CGPoint,filterCount:Int,sectionCount:Int) -> CGRect {
        
        var estimatedHeight = CGFloat()
        
        if sectionCount > 1 {
            estimatedHeight = (CGFloat(filterCount) * 44.0) + 9.0
        } else {
            estimatedHeight = CGFloat(filterCount) * 44.0
        }
        
        let estimatedWidth:CGFloat = width == .regular ? 115.0 : 202.0
        
        switch position {
        case .bottomLeft:
            
            return CGRect(x: center.x, y: SCREEN_HEIGHT - (20.0 + estimatedHeight), width: estimatedWidth, height: estimatedHeight)
        case .bottomRight:
            return CGRect(x: center.x - estimatedWidth, y: SCREEN_HEIGHT - (20.0 + estimatedHeight), width: estimatedWidth, height: estimatedHeight)
        case .freeform:
            
            if (center.y + estimatedHeight) > SCREEN_HEIGHT {
                return CGRect(x: center.x - estimatedWidth, y: SCREEN_HEIGHT - 20 - estimatedHeight, width: estimatedWidth, height: estimatedHeight)
            } else {
                return CGRect(x: center.x - estimatedWidth, y: center.y - (estimatedHeight / 2), width: estimatedWidth, height: estimatedHeight)
            }
        }
    }
    
    //MARK:-TableView Delegate & Datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return filtersArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let subArr:[String] = filtersArray[section]
        
        if filtersArray.count > 1 && section == 0 {
            return subArr.count + 1
        } else {
            return subArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let subArr:[String] = filtersArray[indexPath.section]
        
        if filtersArray.count > 1 && indexPath.section == 0 {
            
            if indexPath.row == subArr.count {
                let separatorCell = self.tableView.dequeueReusableCell(withIdentifier: "separatorCell")!
                return separatorCell
            } else {
                
                let filterCell : TQFilterCell = self.tableView.dequeueReusableCell(withIdentifier: "filterCell") as! TQFilterCell
                
                filterCell.setFilterDatasource(datasource: subArr[indexPath.row] as AnyObject, preSelected: self.preSelectedValue)
                
                return filterCell
            }
            
        } else {
            
            let filterCell : TQFilterCell = self.tableView.dequeueReusableCell(withIdentifier: "filterCell") as! TQFilterCell
            
            filterCell.setFilterDatasource(datasource: subArr[indexPath.row] as AnyObject, preSelected: self.preSelectedValue)
            
            return filterCell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedValue = filtersArray[indexPath.row] as AnyObject
        selectedIndex = indexPath.row
        selectedFilters!(filtersArray[indexPath.row] as AnyObject, indexPath.row)
        dismissAnimate()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let subArr:[String] = filtersArray[indexPath.section]
        
        if filtersArray.count > 1 && indexPath.section == 0 {
            
            if indexPath.row == subArr.count {
                return 9.0
            } else {
                return 44.0
            }
        } else {
            return 44.0
        }
    }
    
    // MARK: - Animation
    func presentAnimationToView() {
        
//        self.tableViewHeightConstraint.constant = CGFloat(44 * self.filtersArray.count)
        self.tableView.layer.masksToBounds = false;
        self.tableView.layer.shadowPath = UIBezierPath.init(rect: CGRect.init(x: 0, y: 0, width: self.tableView.frame.width, height: self.tableView.frame.height)).cgPath
        self.tableView.layer.shadowColor = UIColor.darkGray.cgColor
        self.tableView.layer.shadowRadius = 5.0
        self.tableView.layer.shadowOpacity = 0.5
        self.tableView.layer.cornerRadius = 2
        
        self.view.transform = CGAffineTransform(translationX: 0, y: SCREEN_HEIGHT)
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform.identity
        }, completion: { (complete) in
        })
    }
    
    func dismissAnimate() {
        UIView.animate(withDuration: 0.25, animations: {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            self.view.transform = CGAffineTransform(translationX: 0, y: SCREEN_HEIGHT)
        }, completion: { (true) in
            self.view.removeFromSuperview();
            self.removeFromParentViewController()
        })
    }
    
    //MARK:- Tap Gesture
    func didTap(recognizer:UITapGestureRecognizer) {
        self.dismissAnimate()
    }
}
