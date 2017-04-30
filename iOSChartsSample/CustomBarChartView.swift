//
//  CustomBarChartView.swift
//  iOSChartsSample
//
//  Created by satorun on 2017/04/30.
//  Copyright © 2017年 satorun. All rights reserved.
//

import UIKit
import Charts

class CustomBarChartView: BarChartView {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUp()
    }
    
    var dataModel: DataModel? = nil {
        didSet {
            guard let dataModel = dataModel else { return }
            
            let entries = dataModel.items.map {
                BarChartDataEntry(x: $0.x, y: $0.y)
            }
            
            let dataSet = BarChartDataSet(values: entries, label: nil)
            data = BarChartData(dataSet: dataSet)
            
            let labels = dataModel.items.map {
                "lab\(Int($0.x))"
            }
            xAxis.valueFormatter = IndexAxisValueFormatter(values:labels)
            xAxisRenderer = CustomXAxisRenderer(viewPortHandler: xAxisRenderer.viewPortHandler, xAxis: xAxis, transformer: xAxisRenderer.transformer)
            xAxis.entries = [0,3,9]
            
            leftAxis.axisMaximum = 2000
            leftAxis.axisMinimum = -200
        }
    }
    
    private func setUp() {
        xAxis.labelPosition = .bottom
        //xAxis.setLabelCount(30, force: true)
    }
    
}

class CustomXAxisRenderer: XAxisRenderer {
    
    override func computeAxisValues(min: Double, max: Double)
    {
        // デフォルトではこのメソッドが自動でxAxis.entriesを調整してくれるため、
        // 何もしないようにoverrideする
    }
}

struct DataModel {
    struct Item {
        let x: Double
        //let dateString: String
        let y: Double
    }
    
    let items: [Item]
}

