//
//  StockDetailPresenter.swift
//  TMEStockExchange
//
//  Created by sagar kothari on 26/10/17.
//  Copyright © 2017 sagar kothari. All rights reserved.
//

import UIKit
import Charts

class StockDetailPresenter: NSObject {
  weak var view: StockDetailView!
  var interactor: StockDetailInteractor!
  var router: StockDetailRouter!

  func onViewLoad() {
    view.bindTableViewDataSourceDelegate()
    view.reloadTableView()
    generateChartData(view.stock)
  }

  func generateChartData(_ stock: Stock) {
    view.showProgressHUD()
    interactor.generateChartData(stock, handler: chartDataReceived)
  }

  func chartDataReceived(_ chartData: ChartData, xAxisData: [String], profitInfo: [StockProfit]) {
    view.hideProgressHUD()
    view.updateChart(chartData, xAxisData: xAxisData, profitInfo: profitInfo)
  }

}
