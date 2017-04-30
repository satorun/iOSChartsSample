//
//  ViewController.swift
//  iOSChartsSample
//
//  Created by satorun on 2017/04/30.
//  Copyright © 2017年 satorun. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var chartView: CustomBarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let model = DataModel(items: [Int](0..<10).map {
            DataModel.Item(x: Double($0), y: Double($0*100))
        })
        chartView.dataModel = model
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
