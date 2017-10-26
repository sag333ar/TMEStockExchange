//
//  StockListCell.swift
//  TMEStockExchange
//
//  Created by sagar kothari on 26/10/17.
//  Copyright © 2017 sagar kothari. All rights reserved.
//

import UIKit

class StockListCell: UITableViewCell {

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var subTitleLabel: UILabel!
  @IBOutlet weak var stockValueLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }

  func configureCell(with stock: Stock) {
    titleLabel.text = stock.name
    subTitleLabel.text = stock.abv
    if let price = stock.prices.last?.price {
      stockValueLabel.text = "\(price)"
      if stock.prices.count > 1 {
        let secondLastPrice = stock.prices[stock.prices.count-2].price
        if secondLastPrice > price {
          stockValueLabel.text = "\(stockValueLabel.text!)↓"
          stockValueLabel.textColor = UIColor.red
        } else {
          stockValueLabel.text = "\(stockValueLabel.text!)↑"
          stockValueLabel.textColor = UIColor.green
        }
      } else {
        stockValueLabel.textColor = UIColor.black
      }
    } else {
      stockValueLabel.text = ""
      stockValueLabel.textColor = UIColor.black
    }
  }

}
