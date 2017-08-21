//
//  TQPositiveFeedbackVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 28/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQPositiveFeedbackVC: TQBaseViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.estimatedRowHeight = 220
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.hideNavigationBar = false
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackWhite"), barTintColor: .clear, itemTintColor: .white, isBarTranslucent: true)
        
        self.setNavigationTitle(title: "Feedback", titleColor: .white, subtitle: "Spotify Inc"+bulletUnicode+"Company", subtitleColor: .white)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Tableview Datasource and Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let feedbackDetailsCell = self.tableView.dequeueReusableCell(withIdentifier: "feedbackDetailsCell")
        
        let feedbackSenderCell = self.tableView.dequeueReusableCell(withIdentifier: "feedbackSenderCell")
        
        if indexPath.row == 0 {
            return feedbackSenderCell!
        } else {
            return feedbackDetailsCell!
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 104.0
        } else {
            return UITableViewAutomaticDimension
        }
    }
    
    //MARK:- Button Actions
    @IBAction func giveFeedbackAction(_ sender: UIButton) {
        
        TQNavigationHelper.sharedInstance.pushViewController(storyboard: otherStoryboard, viewController: String(describing: TQNewFeedbackVC.self))
    }
}
