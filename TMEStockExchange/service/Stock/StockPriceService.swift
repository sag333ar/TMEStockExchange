//
//  StockPriceService.swift
//  TMEStockExchange
//
//  Created by sagar kothari on 26/10/17.
//  Copyright © 2017 sagar kothari. All rights reserved.
//

import Foundation

class StockPriceService {

  public static func generatePrices(_ forStocks: [Stock] = StockService.rawStockData,
                                    times: Int = 10,
                                    fromDate: Date = Date(),
                                    minPrice: Int = 0,
                                    maxPrice: Int = 1000
                                    ) -> [Stock] {
    var stockArrayWithPrices: [Stock] = []
    for data in forStocks {
      var prices: [StockPrice] = []
      for i in 0..<times {
        let price = StockPrice(date: DateService.date(i, toDate: Date()),
                               price: NumberService.random(minPrice, to: maxPrice))
        prices.append(price)
      }
      var stock = Stock(name: data.name, abv: data.abv, prices: [])
      stock.prices = prices
      stockArrayWithPrices.append(stock)
    }
    return stockArrayWithPrices
  }

}
