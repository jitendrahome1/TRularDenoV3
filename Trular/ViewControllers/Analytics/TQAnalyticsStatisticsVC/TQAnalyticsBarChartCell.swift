//
//  TQAnalyticsBarChartCell.swift
//  Trular
//
//  Created by Shivapurapu Mahendra on 30/06/17.
//  Copyright © 2017 Indus Net Technologies. All rights reserved.
//

import UIKit
import Charts

class TQAnalyticsBarChartCell: TQBaseTableViewCell,ChartViewDelegate {
    
    @IBOutlet var barChartView: BarChartView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        barChartView.delegate = self
        
        let months = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL"]
        let unitsSold = [1700.0, 3600.0, 4400.0, 4900.0, 4700.0, 3600.0, 4300.0]
        setChartData(dataPoints: months, values: unitsSold)
        setupChartUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //MARK:- Bar Chart Setup
    func setupChartUI() {
        
        barChartView.xAxis.granularity = 1
        barChartView.xAxis.labelPosition = .bottom
        barChartView.drawBordersEnabled = false
        barChartView.xAxis.drawAxisLineEnabled = false
        barChartView.xAxis.drawGridLinesEnabled = false
        barChartView.leftAxis.drawGridLinesEnabled = true
        barChartView.rightAxis.drawGridLinesEnabled = false
        barChartView.rightAxis.drawAxisLineEnabled = false
        barChartView.leftAxis.drawAxisLineEnabled = false
        barChartView.legend.enabled = false
        barChartView.chartDescription?.enabled = false
        barChartView.rightAxis.drawLabelsEnabled = false
        barChartView.isUserInteractionEnabled = false
        
        barChartView.leftAxis.gridColor = .colorWithHexString("#B2D796")
        barChartView.leftAxis.labelTextColor = .white
        barChartView.leftAxis.labelFont = UIFont.init(name: FONT_NAME, size: 10.0)!
        barChartView.xAxis.labelFont = UIFont.init(name: FONT_NAME, size: 10.0)!
        barChartView.xAxis.labelTextColor = .white
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInOutQuad)
    }
    
    func setChartData(dataPoints: [String], values: [Double]) {
        barChartView.noDataText = "You need to provide data for the chart."
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            
            let dataEntry = BarChartDataEntry.init(x: Double(i), yValues: [values[i]])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet.init(values: dataEntries, label: "")
        chartDataSet.colors = [UIColor.white.withAlphaComponent(0.4)]
        chartDataSet.highlightColor = .white
        let chartData = BarChartData.init(dataSets: [chartDataSet])
        
        barChartView.data = chartData
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values:dataPoints)
        
        barChartView.leftAxis.valueFormatter = BarChartYAxisFormatter()
        
        for set:IChartDataSet in (barChartView.data?.dataSets)! {
            set.drawValuesEnabled = !set.drawValuesEnabled
        }
        barChartView.setNeedsDisplay()
    }
}
