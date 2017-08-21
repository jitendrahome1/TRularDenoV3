//
//  TQInquiriesAddAttachment.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 16/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQInquiriesAddAttachment: TQBaseViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.hideNavigationBar = false
        
        self.setLeftNavigationButtons(leftButtonType: .Back, backImage: #imageLiteral(resourceName: "BackBlack"), barTintColor: .white, itemTintColor: .colorWithHexString("#404041"),isBarTranslucent: false)
        
        self.setNavigationTitle(title: "New Inquiry", titleColor: .colorWithHexString("#404041"), subtitle: "Attachments", subtitleColor: .lightGray)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- TableView Delegate and Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            
            let attachedFilesCell = self.tableView.dequeueReusableCell(withIdentifier: "attachedFilesCell")
            return attachedFilesCell!
            
        default:
            
            let addFilesCell = self.tableView.dequeueReusableCell(withIdentifier: "addFilesCell")
            return addFilesCell!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
        
            let actionSheet = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
            
            let galleryAction = UIAlertAction.init(title: "Gallery", style: .default, handler: { (UIAlertAction) in
                
                self.dismiss(animated: true, completion: nil)
                print("Gallery")
                
            })
            let cameraAction = UIAlertAction.init(title: "Camera", style: .default, handler: { (UIAlertAction) in
                
                self.dismiss(animated: true, completion: nil)
                print("Camera")
                
            })
            
            let moreAction = UIAlertAction.init(title: "More...", style: .default, handler: { (UIAlertAction) in
                self.dismiss(animated: true, completion: nil)
                print("More...")
            })
            
            let cancelAction = UIAlertAction.init(title: "Cancel", style: .cancel, handler: { (UIAlertAction) in
                self.dismiss(animated: true, completion: nil)
                print("Cancel")
            })
            
            galleryAction.setValue(UIColor.colorWithHexString("#404041"), forKey: "titleTextColor")
            cameraAction.setValue(UIColor.colorWithHexString("#404041"), forKey: "titleTextColor")
            moreAction.setValue(UIColor.colorWithHexString("#404041"), forKey: "titleTextColor")
            cancelAction.setValue(UIColor.colorWithHexString("#A8ACBB"), forKey: "titleTextColor")
            
            actionSheet.addAction(galleryAction)
            actionSheet.addAction(cameraAction)
            actionSheet.addAction(moreAction)
            actionSheet.addAction(cancelAction)
            
            self.present(actionSheet, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 72
        default:
            return 66
        }
    }
}
