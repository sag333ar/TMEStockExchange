//
//  StockDetailCell.swift
//  TMEStockExchange
//
//  Created by sagar kothari on 26/10/17.
//  Copyright © 2017 sagar kothari. All rights reserved.
//

import UIKit

class StockDetailCell: UITableViewCell {

  @IBOutlet weak var titleLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }

  func configureCell(with stockProfit: StockProfit, dateFormatter: DateFormatter) {
    let buyDate = dateFormatter.string(from: stockProfit.buyDate)
    let sellDate = dateFormatter.string(from: stockProfit.sellDate)
    titleLabel.text = "Profit: \(stockProfit.profit). Bought @ \(stockProfit.buyPrice) on \(buyDate)." +
      "Sold @ \(stockProfit.sellPrice) on \(sellDate)"
  }

}
