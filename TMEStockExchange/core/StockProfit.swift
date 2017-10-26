//
//  StockProfit.swift
//  TMEStockExchange
//
//  Created by sagar kothari on 26/10/17.
//  Copyright © 2017 sagar kothari. All rights reserved.
//

import Foundation

struct StockProfit {
  let buyDate: Date
  let sellDate: Date
  let buyPrice: Int
  let sellPrice: Int

  var profit: Int {
    return sellPrice - buyPrice
  }

  var description: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMMM dd yyyy"
    return "Bought on - \(dateFormatter.string(from: buyDate)) by price \(buyPrice)\n" +
      "Sold on - \(dateFormatter.string(from: sellDate)) by price \(sellPrice)\n" +
    "Profit is of \(profit)"
  }

}
