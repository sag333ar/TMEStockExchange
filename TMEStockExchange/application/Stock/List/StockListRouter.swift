//
//  StockListRouter.swift
//  TMEStockExchange
//
//  Created by sagar kothari on 26/10/17.
//  Copyright © 2017 sagar kothari. All rights reserved.
//

import UIKit

class StockListRouter: NSObject {

  func userSelectedFromListFor(_ stock: Stock, view: StockListView) {
    view.performSegue(withIdentifier: "showDetails", sender: stock)
  }

}

extension StockListRouter {

  func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showDetails",
      let view = segue.destination as? StockDetailView,
      let stock = sender as? Stock {
      view.stock = stock
    }
  }

}
