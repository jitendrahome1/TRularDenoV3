//
//  TQReportsVC.swift
//  Trular
//
//  Created by Indusnet on 28/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Charts

class TQReportsVC: TQBasePagerVC,ChartViewDelegate {
    
    @IBOutlet weak var chartView: BarChartView!
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var headerTitleLbl: UILabel!
    
    @IBOutlet weak var headerValueLbl: UILabel!
    
    @IBOutlet weak var CollectinViewBgView: UIView!
    
    var xValues = [String]()
    var yValues = [Double]()
   
    var vcIndex = "0"
    
    override func viewDidLoad() {
        self.barColor = .clear

        super.viewDidLoad()
        
        xValues = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL"]
        yValues = [5.0, 1.0, 6.0, 3.0, 12.0, 16.0, 4.0]
        
        setChart(dataPoints: xValues, values: yValues)
        setupChartUI()
        setupUI()
        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            
            oldCell?.label.textColor = UIColor.colorWithHexString("#B2D796")
            oldCell?.label.font = UIFont.init(name: MEDIUM_FONT_NAME, size: 12.0)
            newCell?.label.textColor = UIColor.white
            newCell?.label.font = UIFont.init(name: MEDIUM_FONT_NAME, size: 12.0)
        }
    }
    
    func ChildViewAction (_ notification: NSNotification) {
        
        vcIndex=notification.userInfo!["Controller"] as! String
        
        setupUI()
        setupChartUI()
    }
    
    func setupUI()
    {
        if vcIndex=="0" {
     
            //Branches
            
            headerTitleLbl.text="January"
            headerValueLbl.text="$3,812"
            
            headerView.backgroundColor=UIColor.colorWithHexString("#91c569")
            chartView.backgroundColor=UIColor.colorWithHexString("#91c569")
            CollectinViewBgView.backgroundColor=UIColor.colorWithHexString("#91c569")
            
            xValues = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL"]
            yValues = [1700.0, 3600.0, 4400.0, 4900.0, 4700.0, 3600.0, 4300.0]
            
            setChart(dataPoints: xValues, values: yValues)
            self.view.backgroundColor=UIColor.colorWithHexString("#91c569")
            
        }else   if vcIndex=="1"
        {
            //Sources
            
            headerTitleLbl.text="Monday"
            headerValueLbl.text="3,812"
            
            headerView.backgroundColor=UIColor.colorWithHexString("#d55bba")
            chartView.backgroundColor=UIColor.colorWithHexString("#d55bba")
            CollectinViewBgView.backgroundColor=UIColor.colorWithHexString("#d55bba")
             self.view.backgroundColor=UIColor.colorWithHexString("#d55bba")
            
            xValues = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
            yValues = [1700.0, 3600.0, 4400.0, 4900.0, 4700.0, 3600.0, 4300.0]
            
            setChart(dataPoints: xValues, values: yValues)
            
        }else   if vcIndex=="2"
        {
            //Quotes
            headerTitleLbl.text="01:00"
            headerValueLbl.text="3,812"
            
            headerView.backgroundColor=UIColor.colorWithHexString("#84e2c4")
            chartView.backgroundColor=UIColor.colorWithHexString("#84e2c4")
            CollectinViewBgView.backgroundColor=UIColor.colorWithHexString("#84e2c4")
             self.view.backgroundColor=UIColor.colorWithHexString("#84e2c4")

            xValues = ["01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00"]
            yValues = [1700.0, 3600.0, 4400.0, 4900.0, 4700.0, 3600.0, 4300.0]
            
            setChart(dataPoints: xValues, values: yValues)

        }else   if vcIndex=="3"
        {
            //users
            headerTitleLbl.text="Week 1"
            headerValueLbl.text="3,812"
            
            headerView.backgroundColor=UIColor.colorWithHexString("#f0c709")
            chartView.backgroundColor=UIColor.colorWithHexString("#f0c709")
            CollectinViewBgView.backgroundColor=UIColor.colorWithHexString("#f0c709")
            self.view.backgroundColor=UIColor.colorWithHexString("#f0c709")
            
            xValues = ["WEEK 1","WEEK 2","WEEK 3","WEEK 4"]
            yValues = [1700.0, 3600.0, 4400.0, 4900.0, 4700.0, 3600.0, 4300.0]
            
            setChart(dataPoints: xValues, values: yValues)

            
        }else   if vcIndex=="4"
        {
            
            //tags
            
            headerTitleLbl.text="January"
            headerValueLbl.text="3,812"
            
            headerView.backgroundColor=UIColor.colorWithHexString("#f48e1f")
            chartView.backgroundColor=UIColor.colorWithHexString("#f48e1f")
            CollectinViewBgView.backgroundColor=UIColor.colorWithHexString("#f48e1f")
            self.view.backgroundColor=UIColor.colorWithHexString("#f48e1f")

            xValues = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL"]
            yValues = [1700.0, 3600.0, 4400.0, 4900.0, 4700.0, 3600.0, 4300.0]
            setChart(dataPoints: xValues, values: yValues)
            
        }else   if vcIndex=="5"
        {
            
            //canceled
            
            headerTitleLbl.text="January"
            headerValueLbl.text="3,812"
            
            headerView.backgroundColor=UIColor.colorWithHexString("#2d6d75")
            chartView.backgroundColor=UIColor.colorWithHexString("#2d6d75")
            CollectinViewBgView.backgroundColor=UIColor.colorWithHexString("#2d6d75")
             self.view.backgroundColor=UIColor.colorWithHexString("#2d6d75")
            
            xValues = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL"]
            yValues = [1700.0, 3600.0, 4400.0, 4900.0, 4700.0, 3600.0, 4300.0]
            
            setChart(dataPoints: xValues, values: yValues)

        }else   if vcIndex=="6"
        {
            
            //rating
            
            headerTitleLbl.text="January"
            headerValueLbl.text="3,812"
            
            headerView.backgroundColor=UIColor.colorWithHexString("#ef4130")
            chartView.backgroundColor=UIColor.colorWithHexString("#ef4130")
            CollectinViewBgView.backgroundColor=UIColor.colorWithHexString("#ef4130")
              self.view.backgroundColor=UIColor.colorWithHexString("#ef4130")
            
            xValues = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL"]
            yValues = [1700.0, 3600.0, 4400.0, 4900.0, 4700.0, 3600.0, 4300.0]
            
            setChart(dataPoints: xValues, values: yValues)

        }else   if vcIndex=="7"
        {
            //calender
            
            headerTitleLbl.text="January"
            headerValueLbl.text="3,812"
            
            headerView.backgroundColor=UIColor.colorWithHexString("#9d76c1")
            chartView.backgroundColor=UIColor.colorWithHexString("#9d76c1")
            CollectinViewBgView.backgroundColor=UIColor.colorWithHexString("#9d76c1")
              self.view.backgroundColor=UIColor.colorWithHexString("#9d76c1")
            
            xValues = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL"]
            yValues = [1700.0, 3600.0, 4400.0, 4900.0, 4700.0, 3600.0, 4300.0]
            
            setChart(dataPoints: xValues, values: yValues)
            
        }else   if vcIndex=="8"
        {
            //contacts
            headerTitleLbl.text="January"
            headerValueLbl.text="3,812"
            
            headerView.backgroundColor=UIColor.colorWithHexString("#d83c7e")
            chartView.backgroundColor=UIColor.colorWithHexString("#d83c7e")
            CollectinViewBgView.backgroundColor=UIColor.colorWithHexString("#d83c7e")
            self.view.backgroundColor=UIColor.colorWithHexString("#d83c7e")
            
            xValues = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL"]
            yValues = [1700.0, 3600.0, 4400.0, 4900.0, 4700.0, 3600.0, 4300.0]
            
            setChart(dataPoints: xValues, values: yValues)
        }
    }
  
//    override func moveToViewController(at index: Int, animated: Bool = true)
//    {
////        
////        vcIndex=String(index)
////        setupUI()
//
//        
//    }
//    
//    override func updateIndicator(for viewController: PagerTabStripViewController, fromIndex: Int, toIndex: Int, withProgressPercentage progressPercentage: CGFloat, indexWasChanged: Bool) {
//        
//        print(viewController,fromIndex,toIndex,progressPercentage,indexWasChanged)
//        
//        vcIndex=String(toIndex)
//            setupUI()
//        viewDidLoad()
//        
//    }
//
    func setChart(dataPoints: [String], values: [Double]) {
        
        chartView.noDataText = "You need to provide data for the chart."
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            
            let dataEntry = BarChartDataEntry.init(x: Double(i), yValues: [values[i]])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet.init(values: dataEntries, label: "")
        
        if vcIndex=="0" {
            
            //Branches
            chartDataSet.colors = [.colorWithHexString("#D3E8C3")]
            chartView.leftAxis.gridColor = .colorWithHexString("#B2D796")
            
        }else   if vcIndex=="1"
        {
            //Sources
            
            chartDataSet.colors = [.colorWithHexString("#eebde3")]
            chartView.leftAxis.gridColor = .colorWithHexString("#e28dcf")
            
        }else   if vcIndex=="2"
        {
            
            //Quotes
            
            chartDataSet.colors = [.colorWithHexString("#cef3e7")]
            chartView.leftAxis.gridColor = .colorWithHexString("#a9ebd6")
            
            
        }else   if vcIndex=="3"
        {
            
            //Users
            chartDataSet.colors = [.colorWithHexString("#f9e99d")]
            chartView.leftAxis.gridColor = .colorWithHexString("#f5d853")
            
        }else   if vcIndex=="4"
        {
            //Tags
            chartDataSet.colors = [.colorWithHexString("#fbd2a5")]
            chartView.leftAxis.gridColor = .colorWithHexString("#f7b063")
        }else   if vcIndex=="5"
        {
            
            //Canceled
            chartDataSet.colors = [.colorWithHexString("#abc5c8")]
            chartView.leftAxis.gridColor = .colorWithHexString("#6c999f")
            
        }else   if vcIndex=="6"
        {
            
            //rating
            chartDataSet.colors = [.colorWithHexString("#f9b3ac")]
            chartView.leftAxis.gridColor = .colorWithHexString("#f47a6f")
        }else if vcIndex == "7"
        {
            
            //Calender
            chartDataSet.colors = [.colorWithHexString("#d8c8e6")]
            chartView.leftAxis.gridColor = .colorWithHexString("#bb9fd4")
            
        }else if vcIndex == "8"
        {
            
            //Contacts
            chartDataSet.colors = [.colorWithHexString("#efb1cb")]
            chartView.leftAxis.gridColor = .colorWithHexString("#e477a5")
        }
        
        let chartData = BarChartData.init(dataSets: [chartDataSet])
        
        chartView.data = chartData
        chartView.xAxis.valueFormatter = IndexAxisValueFormatter(values:dataPoints)
        
        chartView.leftAxis.valueFormatter = BarChartYAxisFormatter()
        
        for set:IChartDataSet in (chartView.data?.dataSets)! {
            set.drawValuesEnabled = !set.drawValuesEnabled
        }
        
        chartView.setNeedsDisplay()
    }
    
    func setupChartUI() {
        
        chartView.xAxis.granularity = 1
        chartView.xAxis.labelPosition = .bottom
        chartView.drawBordersEnabled = false
        chartView.xAxis.drawAxisLineEnabled = false
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.leftAxis.drawGridLinesEnabled = true
        chartView.rightAxis.drawGridLinesEnabled = false
        chartView.rightAxis.drawAxisLineEnabled = false
        chartView.leftAxis.drawAxisLineEnabled = false
        chartView.legend.enabled = false
        chartView.chartDescription?.enabled = false
        chartView.rightAxis.drawLabelsEnabled = false
        
        chartView.leftAxis.gridColor = .colorWithHexString("#B2D796")
        chartView.leftAxis.labelTextColor = .white
        chartView.leftAxis.labelFont = UIFont.init(name: "HelveticaNeue-bold", size: 10.0)!
        chartView.xAxis.labelFont = UIFont.init(name: "HelveticaNeue-bold", size: 10.0)!
        chartView.xAxis.labelTextColor = .white
        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInOutQuad)
        chartView.isUserInteractionEnabled = false
    }
    
    //MARK:- Charts
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController]  {
       
         let branchesVC = ChartsStoryboard.instantiateViewController(withIdentifier: String(describing: TQReportsBranchesVC.self)) as! TQReportsBranchesVC
         let sourcesVC = ChartsStoryboard.instantiateViewController(withIdentifier: String(describing: TQReportsSourcesVC.self)) as! TQReportsSourcesVC
         let QuotesVC = ChartsStoryboard.instantiateViewController(withIdentifier: String(describing: TQReportsQuotesVC.self)) as! TQReportsQuotesVC
         let usersVC = ChartsStoryboard.instantiateViewController(withIdentifier: String(describing: TQReportsUsers.self)) as! TQReportsUsers
         let tagsVC = ChartsStoryboard.instantiateViewController(withIdentifier: String(describing: TQReportsTagsVC.self)) as! TQReportsTagsVC
         let canceledVC = ChartsStoryboard.instantiateViewController(withIdentifier: String(describing: TQReportsCanceledVC.self)) as! TQReportsCanceledVC
        
         let ratingVC = ChartsStoryboard.instantiateViewController(withIdentifier: String(describing: TQReportsRatingVC.self)) as! TQReportsRatingVC
        
         let calenderVC = ChartsStoryboard.instantiateViewController(withIdentifier: String(describing: TQReportsCalenderVC.self)) as! TQReportsCalenderVC
        
         let ContactsVC = ChartsStoryboard.instantiateViewController(withIdentifier: String(describing: TQReportsContactsVC.self)) as! TQReportsContactsVC
        
        return [branchesVC,sourcesVC,QuotesVC,usersVC,tagsVC,canceledVC,ratingVC,calenderVC,ContactsVC]
            
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.pagerShouldScroll = true
        // Do any additional setup after loading the view.
        
        self.showSidePanel = true
        self.hideNavigationBar = false
        
        self.setLeftNavigationButtons(leftButtonType: .Menu, backImage: nil, barTintColor: .clear, itemTintColor: .white,isBarTranslucent: true)
        
        self.setNavigationTitle(title: "Reports", titleColor: .white, subtitle: "Company"+bulletUnicode+"Year", subtitleColor: .white)
        
        self.setNotificationBtn(notificationCount: 0)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.ChildViewAction(_:)), name: NSNotification.Name(rawValue: "childNotification"), object: nil)
        
        //setupUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
      NotificationCenter.default.removeObserver(self, name:NSNotification.Name(rawValue: "childNotification"), object: nil);
    
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension BarChartView {
    
    private class BarChartFormatter: NSObject, IAxisValueFormatter {
        
        var labels: [String] = []
        
        func stringForValue(_ value: Double, axis: AxisBase?) -> String {
            return labels[Int(value)]
        }
        
        init(labels: [String]) {
            super.init()
            self.labels = labels
        }
    }
    
    func setBarChartData(xValues: [String], yValues: [Double], label: String) {
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<yValues.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: yValues[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: label)
        let chartData = BarChartData(dataSet: chartDataSet)
        
        let chartFormatter = BarChartFormatter(labels: xValues)
        let xAxis = XAxis()
        xAxis.valueFormatter = chartFormatter
        self.xAxis.valueFormatter = xAxis.valueFormatter
        self.xAxis.setLabelCount(xValues.count, force: true)
        
        self.data = chartData
    }
}

