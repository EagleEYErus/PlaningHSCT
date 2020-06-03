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
    private let collectionView = NameStatusesCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = StatePresenterImpl(view: self)
        configureView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupChart()
        barChartView.animate(xAxisDuration: 1.0, yAxisDuration: 1.0)
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
        addCollectionView()
        addBarChartView()
    }
    
    private func addBarChartView() {
        barChartView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(barChartView)
        
        barChartView.snp.makeConstraints {
            $0.left.right.top.equalToSuperview().inset(32)
            $0.bottom.equalTo(collectionView.snp.top).offset(-8)
        }
    }
    
    private func addCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.height.equalTo(100)
            $0.bottom.equalToSuperview().inset(8)
        }
    }
}
