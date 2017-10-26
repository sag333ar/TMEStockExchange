//
//  StockManager.swift
//  TMEStockExchange
//
//  Created by sagar kothari on 26/10/17.
//  Copyright © 2017 sagar kothari. All rights reserved.
//

import Foundation

class StockManagerSDK {

  public static func stockData(_ forStocks: [Stock] = StockService.rawStockData,
                               times: Int = 10,
                               fromDate: Date = Date(),
                               minPrice: Int = 0,
                               maxPrice: Int = 1000) -> [Stock] {
    return StockService.stockData(forStocks,
                                            times: times,
                                            fromDate: fromDate,
                                            minPrice: minPrice,
                                            maxPrice: maxPrice)
  }

  public static func viability(stock: Stock) -> [StockProfit] {
    return StockProfitService.viability(stock: stock)
  }

}
