//
//  SegmentStatusPresenter.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import Foundation

protocol SegmentStatusPresenter {
    var viewModels: [RequestStatusViewModel] { get }
    func createNewStatus()
    func getStatuses() -> [RequestStatus]
}

final class SegmentStatusPresenterImpl: SegmentStatusPresenter {
    private weak var view: SegmentStatusViewController?
    private var statuses: [RequestStatus]
    
    var viewModels = [RequestStatusViewModel]()
    
    init(view: SegmentStatusViewController, statuses: [RequestStatus]) {
        self.view = view
        self.statuses = statuses
        configureViewModel()
    }
    
    func createNewStatus() {
        let newStatus = RequestStatus()
        let newViewModel = RequestStatusViewModel(status: newStatus)
        viewModels.insert(newViewModel, at: 0)
        
        view?.reloadTableView()
    }
    
    func getStatuses() -> [RequestStatus] {
        var statuses = [RequestStatus]()
        for viewModel in viewModels {
            let status = RequestStatus()
            status.status = viewModel.status.rawValue
            status.date = viewModel.date
            statuses.append(status)
        }
        return statuses
    }
}

extension SegmentStatusPresenterImpl {
    private func configureViewModel() {
        viewModels = statuses.compactMap({ RequestStatusViewModel(status: $0) })
    }
}
