//
//  StockListDelegate.swift
//  TMEStockExchange
//
//  Created by sagar kothari on 26/10/17.
//  Copyright © 2017 sagar kothari. All rights reserved.
//

import UIKit

class StockListDelegate: NSObject, UITableViewDelegate {

  weak var view: StockListView!

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 44
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    view.userSelectedFromListFor(view.dataSource.stocks[indexPath.row])
  }

}
