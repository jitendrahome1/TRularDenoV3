//
//  TQNewFeedbackVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 28/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQNewFeedbackVC: TQBaseViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var sendBtn: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.estimatedRowHeight = 177
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.sendBtn.layer.cornerRadius = 2
        self.sendBtn.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.hideNavigationBar = false
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackBlack"), barTintColor: .white, itemTintColor: .colorWithHexString("#404041"), isBarTranslucent: false)
        
        self.setNavigationTitle(title: "Feedback", titleColor: .colorWithHexString("#404041"), subtitle: "Spotify Inc"+bulletUnicode+"Company", subtitleColor: .lightGray)
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
        
        let feedbackReplyCell = self.tableView.dequeueReusableCell(withIdentifier: "feedbackReplyCell")
        
        let ownerRateCell = self.tableView.dequeueReusableCell(withIdentifier: "ownerRateCell")
        
        if indexPath.row == 0 {
            return ownerRateCell!
        } else {
            return feedbackReplyCell!
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 104.0
        } else {
            return UITableViewAutomaticDimension
        }
    }
    
    // MARK: UITextViewDelegate
    func textViewDidChange(_ textView: UITextView) {
        
        let currentOffset = tableView.contentOffset
        UIView.setAnimationsEnabled(false)
        tableView.beginUpdates()
        tableView.endUpdates()
        UIView.setAnimationsEnabled(true)
        tableView.setContentOffset(currentOffset, animated: false)
    }
}
