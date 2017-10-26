//
//  StockDetailView.swift
//  TMEStockExchange
//
//  Created by sagar kothari on 26/10/17.
//  Copyright © 2017 sagar kothari. All rights reserved.
//

import UIKit

class StockDetailView: UIViewController {

  // MARK:- Variables
  var presenter: StockDetailPresenter!
  var stock: Stock?

  override func viewDidLoad() {
    super.viewDidLoad()
    assembleModules()
    presenter.onViewLoad()
  }

  func assembleModules() {
    let interactor = StockDetailInteractor()
    let presenter = StockDetailPresenter()
    let router = StockDetailRouter()
    interactor.presenter = presenter
    presenter.interactor = interactor
    presenter.router = router
    presenter.view = self
    self.presenter = presenter
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}
