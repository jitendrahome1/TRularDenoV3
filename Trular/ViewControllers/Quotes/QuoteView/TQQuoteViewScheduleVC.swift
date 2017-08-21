//
//  TQQuoteViewScheduleVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 25/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import JTAppleCalendar
import XLPagerTabStrip

class TQQuoteViewScheduleVC: UIViewController,JTAppleCalendarViewDataSource, JTAppleCalendarViewDelegate,IndicatorInfoProvider {
    
    @IBOutlet var calendarView: JTAppleCalendarView!
    
    var startDate = Date()
    var endDate = Date()
    
    let monthFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        startDate = formatter.date(from: "2017 01 01")!
        endDate = formatter.date(from: "2017 12 31")!
        
        monthFormatter.dateFormat = "MMMM"
        
        calendarView.dataSource = self
        calendarView.delegate = self
        calendarView.direction = .vertical
        calendarView.scrollDirection = .vertical
        calendarView.scrollingMode = .none
        calendarView.registerCellViewXib(file: "TQCalendarDayCellView")
        calendarView.registerHeaderView(xibFileNames: ["TQCalendarHeaderView"])
        self.calendarView.sectionSpacing = 0
        self.calendarView.itemSize = (SCREEN_WIDTH - 16) / 7
        self.calendarView.cellInset = CGPoint.init(x: 0.0, y: 0.0)
        self.calendarView.scrollToDate(Date(), triggerScrollToDateDelegate: true, animateScroll: false, preferredScrollPosition: nil, completionHandler: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Configure Calendar
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        
        let parameters = ConfigurationParameters(startDate: startDate,
                                                 endDate: endDate,
                                                 numberOfRows: 6, // Only 1, 2, 3, & 6 are allowed
            calendar: Calendar.current,
            generateInDates: .off,
            generateOutDates: .tillEndOfRow,
            firstDayOfWeek: .sunday)
        return parameters
    }
    
    //MARK:- CalendarView Datasource & Delegates
    func calendar(_ calendar: JTAppleCalendarView, willDisplayCell cell: JTAppleDayCellView, date: Date, cellState: CellState) {
        let myCustomCell = cell as! TQCalendarDayCellView
        
        // Setup Cell text
        myCustomCell.dayLabel.text = cellState.text
        
        handleCellTextColor(view: cell, cellState: cellState)
        
        if Calendar.current.isDateInToday(date) {
            myCustomCell.dayLabel.textColor = UIColor.colorWithHexString("#008BFF")
        }
    }

    func handleCellTextColor(view: JTAppleDayCellView?, cellState: CellState) {
        
        guard let myCustomCell = view as? TQCalendarDayCellView  else {
            return
        }
        
        if cellState.dateBelongsTo == .thisMonth {
            myCustomCell.dayLabel.textColor = UIColor.colorWithHexString("#404041")
        } else {
            myCustomCell.dayLabel.textColor = .lightGray
        }
    }
    
    // This sets the height of your header
    func calendar(_ calendar: JTAppleCalendarView, sectionHeaderSizeFor range: (start: Date, end: Date), belongingTo month: Int) -> CGSize {
        return CGSize(width: SCREEN_WIDTH - 32, height: 20)
    }
    // This setups the display of your header
    func calendar(_ calendar: JTAppleCalendarView, willDisplaySectionHeader header: JTAppleHeaderView, range: (start: Date, end: Date), identifier: String) {
        
        let headerCell = (header as? TQCalendarHeaderView)
        headerCell?.title.text = monthFormatter.string(from: range.start).uppercased()
    }
    
    //MARK:- Tab Pager Delegate
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo.init(title: "REQUEST A SCHEDULE")
    }
}
