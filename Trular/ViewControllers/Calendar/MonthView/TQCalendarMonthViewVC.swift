//
//  TQCalendarMonthViewVC.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 11/07/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import JTAppleCalendar

class TQCalendarMonthViewVC: UIViewController,JTAppleCalendarViewDataSource, JTAppleCalendarViewDelegate,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var calendarView: JTAppleCalendarView!
    @IBOutlet var monthLabel: UILabel!
    @IBOutlet var currentDayLbl: UILabel!
    @IBOutlet var daySuffixLbl: UILabel!
    @IBOutlet var currentWeekdayLbl: UILabel!
    @IBOutlet var currentDayEventsLbl: UILabel!
    @IBOutlet var eventTableView: UITableView!    
    
    let monthFormatter = DateFormatter()
    var datasource:[[String:String]]!
    var eventDatasource:[[String:AnyObject]]!
    var dateArr:[Date]!

    //MARK:-View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.setupDummyData()
        self.setupUI()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Initial Setup
    func setupDummyData() {
        datasource = [["invitationType":"Chat","notifDetails":"Chat with customer"],
                      ["invitationType":"Meeting","notifDetails":"Meeting with customer"],
                      ["invitationType":"Call","notifDetails":"Call with customer"]]
        
        dateArr = ["11/07/2017".stringToDateWithCustomFormat("dd/MM/yyyy"),
                   
                   "01/01/2017".stringToDateWithCustomFormat("dd/MM/yyyy"),
                   "31/01/2017".stringToDateWithCustomFormat("dd/MM/yyyy"),
                   "13/01/2017".stringToDateWithCustomFormat("dd/MM/yyyy"),
                   "30/06/2017".stringToDateWithCustomFormat("dd/MM/yyyy"),
                   "31/03/2017".stringToDateWithCustomFormat("dd/MM/yyyy"),
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
                           ["31/03/2017": [EventType.Call, EventType.Chat,EventType.Meeting] as AnyObject],
                           ["08/08/2017": [EventType.Call, EventType.Chat,EventType.Meeting] as AnyObject],
                           ["11/04/2017": [EventType.Call, EventType.Chat,EventType.Meeting] as AnyObject],
                           ["01/04/2017": [EventType.Call, EventType.Chat,EventType.Meeting] as AnyObject],
                           ["29/09/2017": [EventType.Call, EventType.Chat,EventType.Meeting] as AnyObject],
                           ["29/09/2017": [EventType.Call, EventType.Chat,EventType.Meeting] as AnyObject],
                           ["31/12/2017": [EventType.Call, EventType.Chat,EventType.Meeting] as AnyObject],
                           ["23/12/2017": [EventType.Call, EventType.Chat,EventType.Meeting] as AnyObject],
                           ["13/07/2017": [EventType.Call, EventType.Chat,EventType.Meeting] as AnyObject],
                           ["14/07/2017": [EventType.Chat,EventType.Meeting] as AnyObject],
                           ["16/07/2017": [EventType.Chat] as AnyObject],
                           ["19/07/2017": [EventType.Call, EventType.Meeting] as AnyObject],
                           ["20/07/2017": [EventType.Meeting] as AnyObject],
                           ["31/07/2017": [EventType.Call] as AnyObject]]
        
    }
    
    func setupUI() {
        calendarView.dataSource = self
        calendarView.delegate = self
        calendarView.registerCellViewXib(file: "TQCalendarDayCellView")
        calendarView.allowsMultipleSelection  = true
        self.calendarView.sectionSpacing = 0
        self.calendarView.itemSize = (SCREEN_WIDTH - 16) / 7
        self.calendarView.cellInset = CGPoint.init(x: 0.0, y: 0.0)
        monthFormatter.dateFormat = "MMMM"
        self.calendarView.scrollToDate(Date())
        self.calendarView.selectDates(dateArr, triggerSelectionDelegate: true, keepSelectionIfMultiSelectionAllowed: true)
        //        monthLabel.text = monthFormatter.string(from: Date()).uppercased()
        
        self.currentDayLbl.text = "\(Date().getDay())"
        self.currentWeekdayLbl.text = "\(Date().dateToStringWithCustomFormat("E").uppercased())"
        self.daySuffixLbl.text = Date().getDateSuffixForDate(isUppercase:true)!
        
        let dateString = Date().dateToStringWithCustomFormat("dd/MM/yyyy")
        
        if dateArr.contains(Date()) {
            
            let idx = dateArr.index(of: Date())
            let events = eventDatasource[idx!][dateString]
            self.currentDayEventsLbl.text = "You have \(events!.count) events this day."
        } else {
            self.currentDayEventsLbl.text = "You have no events this day."
        }
    }
    
    //MARK:- Configure Calendar
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        
        //        let startDate = formatter.date(from: "2016 02 01")! // You can use date generated from a formatter
        
        var components = DateComponents()
        components.year = 1
        
//        let endDate = Calendar.current.date(byAdding: components, to: Date())                               // You can also use dates created from this function
        let parameters = ConfigurationParameters(startDate: Date(),
                                                 endDate: Date(),
                                                 numberOfRows: 6, // Only 1, 2, 3, & 6 are allowed
            calendar: Calendar.current,
            generateInDates: .off,
            generateOutDates: .tillEndOfRow,
            firstDayOfWeek: .sunday)
        return parameters
    }
    
    //MARK:- Calendar Datasource & Delegates
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
        handleSelection(cell: cell, cellState: cellState)
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
        
        monthLabel.text = monthFormatter.string(from: visibleDates.monthDates.first!).uppercased()
    }

    //MARK:- TableView Datasource & Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let calendarEventCell : TQCalendarEventCell = self.eventTableView.dequeueReusableCell(withIdentifier: String(describing:TQCalendarEventCell.self)) as! TQCalendarEventCell
        
        calendarEventCell.dataSource = datasource[indexPath.row] as AnyObject
        
        return calendarEventCell
    }
    
    //MARK:- Draw arc segments
    
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
        
//        arcView.backgroundColor = .lightGray
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
