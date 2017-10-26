//
//  StockDetailView.swift
//  TMEStockExchange
//
//  Created by sagar kothari on 26/10/17.
//  Copyright © 2017 sagar kothari. All rights reserved.
//

import UIKit
import Charts
import MBProgressHUD

class StockDetailView: UIViewController {

  // MARK:- IBOutlets
  @IBOutlet weak var barChartView: BarChartView!
  @IBOutlet weak var stockProfitTableView: UITableView!

  // MARK:- Variables
  var presenter: StockDetailPresenter!
  var stock: Stock!
  var dataSource = StockDetailDataSource()
  var delegate = StockDetailDelegate()
  let dateFormatter = DateFormatter()

  override func viewDidLoad() {
    super.viewDidLoad()
    assembleModules()
    presenter.onViewLoad()
    barChartView.noDataText = "You need to provide data for the chart."
    barChartView.xAxis.labelPosition = .bottom
    barChartView.chartDescription?.text = "Dates"
    dateFormatter.dateFormat = "dd MMM"
  }

  func updateChart(_ chartData: ChartData, xAxisData: [String], profitInfo: [StockProfit]) {
    DispatchQueue.main.async {
      self.barChartView.data = chartData
      let formato:BarChartFormatter = BarChartFormatter()
      formato.xAxisData = xAxisData
      let xaxis:XAxis = XAxis()
      xaxis.valueFormatter = formato
      self.barChartView.xAxis.valueFormatter = xaxis.valueFormatter
      self.updateData(profitInfo)
    }
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

}

// MARK:- Extension for Tableview management
extension StockDetailView {

  func bindTableViewDataSourceDelegate() {
    stockProfitTableView.dataSource = dataSource
    dataSource.view = self
    stockProfitTableView.delegate = delegate
    delegate.view = self
  }

  func reloadTableView() {
    DispatchQueue.main.async {
      self.stockProfitTableView.reloadData()
    }
  }

  func updateData(_ stockProfit: [StockProfit]) {
    dataSource.stockProfit = stockProfit
    reloadTableView()
  }

}

// MARK:- View Appear, Disappear, memory warning methods, prepare for segue
extension StockDetailView {

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    title = stock.name
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    title = ""
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}

// MARK:- Extension for progressHUD management
extension StockDetailView {

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

