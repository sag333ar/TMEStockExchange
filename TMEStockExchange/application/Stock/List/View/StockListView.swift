//
//  StockListView.swift
//  TMEStockExchange
//
//  Created by sagar kothari on 26/10/17.
//  Copyright © 2017 sagar kothari. All rights reserved.
//

import UIKit
import MBProgressHUD

class StockListView: UIViewController {

  // MARK:- IBOutlets
  @IBOutlet weak var stockTableView: UITableView!

  // MARK:- Variables
  var presenter: StockListPresenter!
  var dataSource = StockListDataSource()
  var delegate = StockListDelegate()

  // MARK:- View Did load, assemble modules
  override func viewDidLoad() {
    super.viewDidLoad()
    assembleModules()
    presenter.onViewLoad()
  }

  func assembleModules() {
    let interactor = StockListInteractor()
    let presenter = StockListPresenter()
    let router = StockListRouter()
    interactor.presenter = presenter
    presenter.interactor = interactor
    presenter.router = router
    presenter.view = self
    self.presenter = presenter
  }

}

// MARK:- Extension for Tableview management
extension StockListView {

  func bindTableViewDataSourceDelegate() {
    stockTableView.dataSource = dataSource
    dataSource.view = self
    stockTableView.delegate = delegate
    delegate.view = self
  }

  func reloadTableView() {
    DispatchQueue.main.async {
      self.stockTableView.reloadData()
    }
  }

  func updateData(_ stocks: [Stock]) {
    dataSource.stocks = stocks
    reloadTableView()
  }

}

// MARK:- Extension for progressHUD management
extension StockListView {

  func showProgressHUD() {
    DispatchQueue.main.async {
      let hud = MBProgressHUD(view: self.view)
      self.view.addSubview(hud)
      hud.show(animated: true)
    }
  }

  func hideProgressHUD() {
    DispatchQueue.main.async {
      MBProgressHUD.hide(for: self.view, animated: true)
    }
  }

}

// MARK:- View Appear, Disappear, memory warning methods, prepare for segue
extension StockListView {

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    title = "Stock Exchange"
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    title = ""
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    presenter.prepare(for: segue, sender: sender)
  }

}

// MARK:- Extension for user actions
extension StockListView {

  @IBAction func btnRefreshTapped(sender: AnyObject) {
    presenter.fetchData()
  }

  func userSelectedFromListFor(_ stock: Stock) {
    presenter.userSelectedFromListFor(stock, view: self)
  }

}
