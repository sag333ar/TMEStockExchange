//
//  StockService.swift
//  TMEStockExchange
//
//  Created by sagar kothari on 26/10/17.
//  Copyright © 2017 sagar kothari. All rights reserved.
//

import Foundation

class StockService {

  public static var rawStockData: [Stock] {
    return [
      Stock(name: "Apple", abv: "APL", prices: []),
      Stock(name: "Reliance", abv: "RIL", prices: []),
      Stock(name: "Axis Bank", abv: "AXS", prices: []),
      Stock(name: "Bharti Airtel", abv: "AIR", prices: []),
      Stock(name: "Maruti Suzuki", abv: "MSZ", prices: [])
    ]
  }

  public static var stockDataWithPrices: [Stock] {
    return StockPriceService.generatePrices()
  }

  public static func stockData(_ forStocks: [Stock] = StockService.rawStockData,
                               times: Int = 10,
                               fromDate: Date = Date(),
                               minPrice: Int = 0,
                               maxPrice: Int = 1000) -> [Stock] {
    return StockPriceService.generatePrices(forStocks,
                                            times: times,
                                            fromDate: fromDate,
                                            minPrice: minPrice,
                                            maxPrice: maxPrice)
  }

}
