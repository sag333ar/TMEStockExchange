//
//  StockDetailPresenter.swift
//  TMEStockExchange
//
//  Created by sagar kothari on 26/10/17.
//  Copyright © 2017 sagar kothari. All rights reserved.
//

import UIKit

class StockDetailPresenter: NSObject {
  weak var view: StockDetailView!
  var interactor: StockDetailInteractor!
  var router: StockDetailRouter!

  func onViewLoad() {
  }

}
