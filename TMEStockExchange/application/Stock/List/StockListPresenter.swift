//
//  StockListPresenter.swift
//  TMEStockExchange
//
//  Created by sagar kothari on 26/10/17.
//  Copyright © 2017 sagar kothari. All rights reserved.
//

import UIKit

class StockListPresenter: NSObject {

  weak var view: StockListView!
  var interactor: StockListInteractor!
  var router: StockListRouter!

  func onViewLoad() {
    view.bindTableViewDataSourceDelegate()
    view.reloadTableView()
    fetchData()
  }

  func fetchData() {
    view.showProgressHUD()
    interactor.fetchStockData(stocksDataFetched(_:))
  }

  func stocksDataFetched(_ stocks: [Stock]) {
    view.hideProgressHUD()
    view.updateData(stocks)
  }

}

extension StockListPresenter {

  func userSelectedFromListFor(_ stock: Stock, view: StockListView) {
  }

  func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    router.prepare(for: segue, sender: sender)
  }

}
