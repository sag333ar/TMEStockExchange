//
//  StockDetailDataSource.swift
//  TMEStockExchange
//
//  Created by sagar kothari on 26/10/17.
//  Copyright © 2017 sagar kothari. All rights reserved.
//

import UIKit

class StockDetailDataSource: NSObject, UITableViewDataSource {

  weak var view: StockDetailView!
  var stockProfit: [StockProfit] = []

  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return stockProfit.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    if let stockDetailCell = cell as? StockDetailCell {
      stockDetailCell.configureCell(with: stockProfit[indexPath.row],
                                    dateFormatter: view.dateFormatter)
    }
    return cell
  }

}
