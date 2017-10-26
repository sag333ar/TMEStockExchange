//
//  BarChartFormatter.swift
//  TMEStockExchange
//
//  Created by sagar kothari on 26/10/17.
//  Copyright © 2017 sagar kothari. All rights reserved.
//

import UIKit
import Charts

@objc(BarChartFormatter)
public class BarChartFormatter: NSObject, IAxisValueFormatter {
  var xAxisData: [String] = []
  public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
    return xAxisData[Int(value)]
  }
}
