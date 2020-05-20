//
//  SegmentRequestPresenter.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import Foundation

protocol SegmentRequestPresenter {
    var viewModels: [CellViewModel] { get }
}

final class SegmentRequestPresenterImpl: SegmentRequestPresenter {
    private weak var view: SegmentRequestViewController?
    private let request: Request
    
    var viewModels = [CellViewModel]()
    
    init(view: SegmentRequestViewController, request: Request) {
        self.view = view
        self.request = request
        configureViewModel()
    }
}

extension SegmentRequestPresenterImpl {
    private func configureViewModel() {
        viewModels = [
            RequestCellsTherapyViewModel(request: request),
            RequestDateCellsTherapyViewModel(request: request)
        ]
    }
}
