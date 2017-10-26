//
//  StockListInteractor.swift
//  TMEStockExchange
//
//  Created by sagar kothari on 26/10/17.
//  Copyright © 2017 sagar kothari. All rights reserved.
//

import UIKit

class StockListInteractor: NSObject {

  weak var presenter: StockListPresenter!

  func fetchStockData(_ handler: @escaping (([Stock]) -> Void)) {
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
      let stocks = StockManagerSDK.stockData()
      handler(stocks)
    }
  }

}
