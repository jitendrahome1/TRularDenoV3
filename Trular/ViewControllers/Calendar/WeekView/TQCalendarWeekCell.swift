//
//  TQCalendarWeekCell.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 13/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit

class TQCalendarWeekCell: TQBaseTableViewCell {

    @IBOutlet private weak var eventCollectionView: UICollectionView!
    
    @IBOutlet var eventCountLbl: UILabel!
    
    //Curent Date Settings
    @IBOutlet var currentDayLbl: UILabel!
    @IBOutlet var currentWeekdayLbl: UILabel!
    @IBOutlet var currentDaySuffixLbl: UILabel!
    
    //Constraints
    @IBOutlet var collectionViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet var collectionViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet var eventCountLblWidthConstraint: NSLayoutConstraint!
    @IBOutlet var eventCountLblTrailingConstraint: NSLayoutConstraint!
    
    var isForUpcoming:Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var setWeek: Int! {
        didSet {
            let calendar = Calendar(identifier: .gregorian)
            var dtComp = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date())
            dtComp.weekday = setWeek
            
            if isForUpcoming {
                dtComp.weekOfYear = dtComp.weekOfYear! + 1
            }
            
            let dayFormat = DateFormatter()
            dayFormat.dateFormat = "dd"
            
            self.currentDayLbl.text = dayFormat.string(from: calendar.date(from: dtComp)!)
            self.currentWeekdayLbl.text = "\(calendar.date(from: dtComp)!.dateToStringWithCustomFormat("E").uppercased())"
            self.currentDaySuffixLbl.text = calendar.date(from: dtComp)!.getDateSuffixForDate(isUppercase:true)!
        }
    }
    
    override var dataSource: AnyObject! {
        
        didSet {
            
            let start = Date().startOfWeek
            
            print(start!)
            
            let eventCount = dataSource as! Int
            
            if eventCount > 0 {
                
                var availableWidth:Int = Int(SCREEN_WIDTH - 108)
                
                var cellsThatCanFit:Int = 0
                
                if eventCount > 1 {
                    
                    cellsThatCanFit = availableWidth / 23

                } else {
                    
                    cellsThatCanFit = 1
                }
                
                if eventCount > cellsThatCanFit {
                    
                    availableWidth -= 30
                    cellsThatCanFit = availableWidth / 23
                    
                    if eventCount > 99 {
                        self.eventCountLbl.text = "+99"
                    } else {
                        self.eventCountLbl.text = "+\(eventCount - cellsThatCanFit)"
                    }
                    
                    self.collectionViewWidthConstraint.constant = CGFloat(cellsThatCanFit * 23)//CGFloat(((cellsThatCanFit - 1) * 8) + (cellsThatCanFit * 15))
                    self.collectionViewTrailingConstraint.constant = 8
                    self.eventCountLblWidthConstraint.constant = 15
                    self.eventCountLblTrailingConstraint.constant = 8
                    
                } else {
                    
                    self.collectionViewWidthConstraint.constant = CGFloat(eventCount * 23)//CGFloat(((eventCount - 1) * 8) + (eventCount * 15))
                    self.eventCountLblWidthConstraint.constant = 0
                    self.eventCountLblTrailingConstraint.constant = 0
                }
                
            } else {
                
                self.collectionViewWidthConstraint.constant = 0
                self.collectionViewTrailingConstraint.constant = 0
                self.eventCountLblWidthConstraint.constant = 0
                self.eventCountLblTrailingConstraint.constant = 0
            }
        }
    }

    func setCollectionViewDataSourceDelegate
        <D: UICollectionViewDataSource & UICollectionViewDelegate>
        (dataSourceDelegate: D, forRow row: Int) {
        
        eventCollectionView.delegate = dataSourceDelegate
        eventCollectionView.dataSource = dataSourceDelegate
        eventCollectionView.tag = row
        eventCollectionView.reloadData()
    }
}
