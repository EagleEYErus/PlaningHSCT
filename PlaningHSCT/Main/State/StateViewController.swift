//
//  StateViewController.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import UIKit
import Charts

final class StateViewController: BaseViewController {
    private var presenter: StatePresenter!
    private let allCases = RequestStatusType.allCases
    
    private let barChartView = BarChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = StatePresenterImpl(view: self)
        configureView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupChart()
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
    }
    
    private func setupChart() {
        let values = getValues()
        let types = allCases.compactMap({ $0.title })
        
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<types.count {
          let dataEntry = BarChartDataEntry(x: Double(i), y: Double(values[i]))
          dataEntries.append(dataEntry)
        }
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Статусы заявок")
        chartDataSet.colors = allCases.compactMap({ $0.color })
        
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView.data = chartData
    }
    
    private func getValues() -> [Int] {
        let requests = RealmServiceImpl.shared.get(Request.self)
        var values = [Int]()
        for _ in allCases {
            values.append(0)
        }
        for request in requests {
            for status in request.statuses {
                values[status.status] += 1
            }
        }
        return values
    }
}

extension StateViewController {
    private func configureView() {
        title = "Состояние"
        addBarChartView()
    }
    
    private func addBarChartView() {
        barChartView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(barChartView)
        
        barChartView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(32)
        }
    }
}
