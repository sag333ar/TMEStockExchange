//
//  StockListDataSource.swift
//  TMEStockExchange
//
//  Created by sagar kothari on 26/10/17.
//  Copyright © 2017 sagar kothari. All rights reserved.
//

import UIKit

class StockListDataSource: NSObject, UITableViewDataSource {

  weak var view: StockListView!
  var stocks: [Stock] = []

  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return stocks.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    if let stockListCell = cell as? StockListCell {
      stockListCell.configureCell(with: stocks[indexPath.row])
    }
    return cell
  }

}
