//
//  StockProfitService.swift
//  TMEStockExchange
//
//  Created by sagar kothari on 26/10/17.
//  Copyright © 2017 sagar kothari. All rights reserved.
//

class StockProfitService {

  public static func viability(stock: Stock) -> [StockProfit] {
    let fillProfit = StockProfit(buyDate: stock.prices[0].date,
                                 sellDate: stock.prices[1].date,
                                 buyPrice: stock.prices[0].price,
                                 sellPrice: stock.prices[1].price)
    var stockProfits:[StockProfit] = Array(repeating: fillProfit, count: stock.prices.count)
    for i in 0..<stock.prices.count-1 {
      var stockProfit = StockProfit(buyDate: stock.prices[i].date,
                                    sellDate: stock.prices[i+1].date,
                                    buyPrice: stock.prices[i].price,
                                    sellPrice: stock.prices[i+1].price)
      for j in i+2..<stock.prices.count {
        let compareProfit = StockProfit(buyDate: stock.prices[i].date,
                                        sellDate: stock.prices[j].date,
                                        buyPrice: stock.prices[i].price,
                                        sellPrice: stock.prices[j].price)
        if stockProfit.profit < compareProfit.profit {
          stockProfit = compareProfit
        }
      }
      stockProfits[i] = stockProfit
    }
    stockProfits = stockProfits.sorted(by: { $0.profit > $1.profit })
    return stockProfits
  }

}
