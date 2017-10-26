//
//  Stock.swift
//  TMEStockExchange
//
//  Created by sagar kothari on 26/10/17.
//  Copyright © 2017 sagar kothari. All rights reserved.
//

import Foundation

struct Stock {
  let name: String
  let abv: String
  var prices: [StockPrice] = []
}
