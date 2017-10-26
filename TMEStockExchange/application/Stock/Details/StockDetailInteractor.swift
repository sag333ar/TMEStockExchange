//
//  StockDetailInteractor.swift
//  TMEStockExchange
//
//  Created by sagar kothari on 26/10/17.
//  Copyright © 2017 sagar kothari. All rights reserved.
//

import UIKit
import Charts

class StockDetailInteractor: NSObject {
  weak var presenter: StockDetailPresenter!

  func generateChartData(_ stock: Stock,
                         handler: @escaping ((ChartData, [String], [StockProfit]) -> Void)) {
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
      var dataEntries: [BarChartDataEntry] = []
      var dateEntries: [String] = []
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "dd MMM"
      for i in 0..<stock.prices.count {
        let yValue = stock.prices[i].price * 100 / 1000
        let dataEntry = BarChartDataEntry(x: Double(i), yValues: [Double(yValue)])
        dataEntries.append(dataEntry)
        let dateEntry = dateFormatter.string(from: stock.prices[i].date)
        dateEntries.append(dateEntry)
      }
      let chartDataSet = BarChartDataSet(values: dataEntries, label: "Price in %")
      let chartColorsData = self.chartDataColors(stock)
      chartDataSet.colors = chartColorsData.1
      let chartData = BarChartData(dataSet: chartDataSet)
      handler(chartData, dateEntries, chartColorsData.0)
    }
  }

  func chartDataColors(_ stock: Stock) -> ([StockProfit], [NSUIColor]){
    let viability = StockManagerSDK.viability(stock: stock)
    var colors: [UIColor] = []
    for i in 0..<stock.prices.count {
      if viability[0].buyDate == stock.prices[i].date || viability[0].sellDate == stock.prices[i].date {
        colors.append(UIColor.green)
      } else if viability[1].buyDate == stock.prices[i].date || viability[1].sellDate == stock.prices[i].date {
        colors.append(UIColor.yellow)
      } else {
        colors.append(UIColor.gray)
      }
    }
    return (viability, colors)
  }

}
