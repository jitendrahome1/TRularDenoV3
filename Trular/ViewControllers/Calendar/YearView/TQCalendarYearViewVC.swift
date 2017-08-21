//
//  TQCalendarYearViewVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 12/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import JTAppleCalendar

class TQCalendarYearViewVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,JTAppleCalendarViewDataSource, JTAppleCalendarViewDelegate {
    
    @IBOutlet var monthsCollectionView: UICollectionView!
    
    @IBOutlet var calendarView: JTAppleCalendarView!
    
    let monthFormatter = DateFormatter()
    let sectionFormatter = DateFormatter()
    
    var monthDatsource:[[String:AnyObject]]!
    var eventDatasource:[[String:AnyObject]]!
    var dateArr:[Date]!
    
    var selectedIndex: Int = 1
    
    var startDate = Date()
    var endDate = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupDummyData()

        // Do any additional setup after loading the view.
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        startDate = formatter.date(from: "2017 01 01")!
        endDate = formatter.date(from: "2017 12 31")!
        
        calendarView.dataSource = self
        calendarView.delegate = self
        calendarView.direction = .vertical
        calendarView.scrollDirection = .vertical
        calendarView.scrollingMode = .nonStopToSection(withResistance: 0.3)
        calendarView.registerCellViewXib(file: "TQCalendarDayCellView")
        calendarView.registerHeaderView(xibFileNames: ["TQCalendarHeaderView"])
        self.calendarView.sectionSpacing = 0
        self.calendarView.itemSize = (SCREEN_WIDTH - 16) / 7
        self.calendarView.cellInset = CGPoint.init(x: 0.0, y: 0.0)
        
        monthFormatter.dateFormat = "MMMM"
        sectionFormatter.dateFormat = "MMM"

        self.calendarView.scrollToDate(Date(), triggerScrollToDateDelegate: true, animateScroll: false, preferredScrollPosition: nil, completionHandler: nil)
        self.calendarView.selectDates(dateArr, triggerSelectionDelegate: true, keepSelectionIfMultiSelectionAllowed: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupDummyData() {
        self.monthDatsource = [
            ["monthName":"JAN" as AnyObject,"monthTag":1 as AnyObject],
            ["monthName":"FEB" as AnyObject,"monthTag":2 as AnyObject],
            ["monthName":"MAR" as AnyObject,"monthTag":3 as AnyObject],
            ["monthName":"APR" as AnyObject,"monthTag":4 as AnyObject],
            ["monthName":"MAY" as AnyObject,"monthTag":5 as AnyObject],
            ["monthName":"JUN" as AnyObject,"monthTag":6 as AnyObject],
            ["monthName":"JUL" as AnyObject,"monthTag":7 as AnyObject],
            ["monthName":"AUG" as AnyObject,"monthTag":8 as AnyObject],
            ["monthName":"SEP" as AnyObject,"monthTag":9 as AnyObject],
            ["monthName":"OCT" as AnyObject,"monthTag":10 as AnyObject],
            ["monthName":"NOV" as AnyObject,"monthTag":11 as AnyObject],
            ["monthName":"DEC" as AnyObject,"monthTag":12 as AnyObject]]
        
        dateArr = ["11/07/2017".stringToDateWithCustomFormat("dd/MM/yyyy"),
                   
                   "01/01/2017".stringToDateWithCustomFormat("dd/MM/yyyy"),
                   "31/01/2017".stringToDateWithCustomFormat("dd/MM/yyyy"),
                   "13/01/2017".stringToDateWithCustomFormat("dd/MM/yyyy"),
                   "30/06/2017".stringToDateWithCustomFormat("dd/MM/yyyy"),
                   "10/03/2017".stringToDateWithCustomFormat("dd/MM/yyyy"),
                   "08/08/2017".stringToDateWithCustomFormat("dd/MM/yyyy"),
                   "11/04/2017".stringToDateWithCustomFormat("dd/MM/yyyy"),
                   "01/04/2017".stringToDateWithCustomFormat("dd/MM/yyyy"),
                   "29/09/2017".stringToDateWithCustomFormat("dd/MM/yyyy"),
                   "14/10/2017".stringToDateWithCustomFormat("dd/MM/yyyy"),
                   "31/12/2017".stringToDateWithCustomFormat("dd/MM/yyyy"),
                   "23/12/2017".stringToDateWithCustomFormat("dd/MM/yyyy"),
                   
                   "13/07/2017".stringToDateWithCustomFormat("dd/MM/yyyy"),
                   "14/07/2017".stringToDateWithCustomFormat("dd/MM/yyyy"),
                   "16/07/2017".stringToDateWithCustomFormat("dd/MM/yyyy"),
                   "19/07/2017".stringToDateWithCustomFormat("dd/MM/yyyy"),
                   "20/07/2017".stringToDateWithCustomFormat("dd/MM/yyyy"),
                   "31/07/2017".stringToDateWithCustomFormat("dd/MM/yyyy")]
        
        eventDatasource = [["11/07/2017": [EventType.Call, EventType.Chat,EventType.Meeting] as AnyObject],
                           
                           ["01/01/2017": [EventType.Call, EventType.Chat,EventType.Meeting] as AnyObject],
                           ["31/01/2017": [EventType.Call, EventType.Chat,EventType.Meeting] as AnyObject],
                           ["13/01/2017": [EventType.Call, EventType.Chat,EventType.Meeting] as AnyObject],
                           ["30/06/2017": [EventType.Call, EventType.Chat,EventType.Meeting] as AnyObject],
                           ["10/03/2017": [EventType.Call, EventType.Chat,EventType.Meeting] as AnyObject],
                           ["08/08/2017": [EventType.Call, EventType.Chat,EventType.Meeting] as AnyObject],
                           ["11/04/2017": [EventType.Call, EventType.Chat,EventType.Meeting] as AnyObject],
                           ["01/04/2017": [EventType.Call, EventType.Chat,EventType.Meeting] as AnyObject],
                           ["29/09/2017": [EventType.Call, EventType.Chat,EventType.Meeting] as AnyObject],
                           ["14/10/2017": [EventType.Call, EventType.Chat,EventType.Meeting] as AnyObject],
                           ["31/12/2017": [EventType.Call, EventType.Chat,EventType.Meeting] as AnyObject],
                           ["23/12/2017": [EventType.Call, EventType.Chat,EventType.Meeting] as AnyObject],
                           
                           ["13/07/2017": [EventType.Call, EventType.Chat,EventType.Meeting] as AnyObject],
                           ["14/07/2017": [EventType.Chat,EventType.Meeting] as AnyObject],
                           ["16/07/2017": [EventType.Chat] as AnyObject],
                           ["19/07/2017": [EventType.Call, EventType.Meeting] as AnyObject],
                           ["20/07/2017": [EventType.Meeting] as AnyObject],
                           ["31/07/2017": [EventType.Call] as AnyObject]]
    }

    //MARK:- CollectionView Delegate & Datasource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let monthCell : TQCalendarMonthCell = self.monthsCollectionView.dequeueReusableCell(withReuseIdentifier: String(describing:TQCalendarMonthCell.self), for: indexPath) as! TQCalendarMonthCell
        monthCell.dataSource = monthDatsource[indexPath.row] as AnyObject
        
        if indexPath.row == selectedIndex - 1 {
            
            monthCell.monthNameLabel.textColor = UIColor.colorWithHexString("#404041")
            monthCell.separatorLabel.backgroundColor = UIColor.colorWithHexString("#404041")
            
        } else {
            monthCell.monthNameLabel.textColor = UIColor.lightGray
            monthCell.separatorLabel.backgroundColor = UIColor.colorWithHexString("#DEE5F0")
        }
        
        return monthCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     
        let month:Int = self.monthDatsource[indexPath.row]["monthTag"] as! Int
        
        let dateComponents = NSDateComponents()
        dateComponents.month = month
        dateComponents.day = 1
        dateComponents.year = 2017
        
        let dat = Calendar.current.date(from: dateComponents as DateComponents)!
        
        self.calendarView.scrollToDate(dat)
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
        handleSelection(cell: cell, cellState: cellState)

        if Calendar.current.isDateInToday(date) {
            myCustomCell.dayLabel.textColor = UIColor.colorWithHexString("#008BFF")
        }
        
//        self.setupCellBeforeDisplay(cellState: cellState, date: date ,arcView:myCustomCell.backgroundView, dateLbl: myCustomCell.dayLabel)
//        myCustomCell.updateConstraintsIfNeeded()
//        myCustomCell.setNeedsDisplay()
    }
    
    func handleSelection(cell: JTAppleDayCellView?, cellState: CellState) {
        
        let myCustomCell = cell as! TQCalendarDayCellView // You created the cell view if you followed the tutorial
        switch cellState.selectedPosition() {
        case .full, .left, .right:
            self.setupCellBeforeDisplay(cellState: cellState, date: cellState.date ,arcView:myCustomCell.backgroundView, dateLbl: myCustomCell.dayLabel)
        case .middle:
            self.setupCellBeforeDisplay(cellState: cellState, date: cellState.date ,arcView:myCustomCell.backgroundView, dateLbl: myCustomCell.dayLabel)
        default:
            self.setupCellBeforeDisplay(cellState: cellState, date: cellState.date ,arcView:myCustomCell.backgroundView, dateLbl: myCustomCell.dayLabel)
        }
    }
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleDayCellView?, cellState: CellState) {
//        handleSelection(cell: cell, cellState: cellState)
    }
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleDayCellView?, cellState: CellState) {
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
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo)
    {
        var aDate:Date?
        
        if Calendar.current.component(.day, from: visibleDates.monthDates.first!) > 5 {
            
            aDate = visibleDates.monthDates.last
            
        } else {
            
            aDate = visibleDates.monthDates.first
        }
        
        if let dt = aDate {
            
            print(dt)
            
            print(Calendar.current.component(.month, from: dt))
            
            selectedIndex = Calendar.current.component(.month, from: dt)
            self.monthsCollectionView.reloadData()
            self.monthsCollectionView.scrollToItem(at: IndexPath.init(row: selectedIndex - 1, section: 0) as IndexPath, at: .centeredHorizontally, animated: true)
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
    
    func setupCellBeforeDisplay(cellState: CellState, date: Date, arcView:UIView, dateLbl:UILabel) {
        let dateString = date.dateToStringWithCustomFormat("dd/MM/yyyy")
        
        if dateArr.contains(date) {
            
            let idx = dateArr.index(of: date)
            let events = eventDatasource[idx!][dateString]
            self.addArcSegmentsForEvents(events: events as! [EventType],arcView: arcView, dateLbl:dateLbl)
        } else {
            arcView.layer.sublayers?.removeAll()
        }
    }
    
    func addArcSegmentsForEvents(events:[EventType],arcView:UIView, dateLbl:UILabel) {
        
        let count: Int = events.count
        let gapSize: CGFloat = 0.0
        let segmentAngleSize: CGFloat = (2.0 * CGFloat(CGFloat.pi) - CGFloat(count) * gapSize) / CGFloat(count)
        let center = CGPoint(x: arcView.frame.size.width / 2.0, y: arcView.frame.size.height / 2.0)
        
        var radius: CGFloat = 0.0
        
//        if IS_OF_4_INCH() || IS_IPHONE_4S() {
//            radius = arcView.frame.size.height * 0.5
//        } else {
            radius = arcView.frame.size.width * 0.4
//        }
        
        let lineWidth: CGFloat = 3
        
        arcView.layer.sublayers?.removeAll()
        
        for i in 0 ..< events.count {
            let start = CGFloat(i) * (segmentAngleSize + gapSize) - CGFloat(CGFloat.pi / 2.0)
            let end = start + segmentAngleSize
            let segmentPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: start, endAngle: end, clockwise: true)
            
            let arcLayer = CAShapeLayer()
            arcLayer.path = segmentPath.cgPath
            arcLayer.fillColor = UIColor.clear.cgColor
            
            if events[i] == .Call {
                arcLayer.strokeColor = UIColor.colorWithHexString("#93c9ce").cgColor
            } else if events[i] == .Chat {
                arcLayer.strokeColor = UIColor.colorWithHexString("#9d76c1").cgColor
            } else if events[i] == .Meeting {
                arcLayer.strokeColor = UIColor.colorWithHexString("#91c569").cgColor
            }
            arcLayer.lineWidth = lineWidth
            
            arcView.layer.addSublayer(arcLayer)
        }
    }
}
