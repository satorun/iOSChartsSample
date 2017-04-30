//: Playground - noun: a place where people can play

import PlaygroundSupport

let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 667))
containerView.backgroundColor = UIColor.gray

//PlaygroundPage.current.needsIndefiniteExecution = true

PlaygroundPage.current.liveView = containerView


import UIKit

import Charts

let chartView = BarChartView(frame: CGRect(x: 0.0, y: 30.0, width: containerView.frame.width, height: 300))

containerView.addSubview(chartView)
// 補完が効かない。。。