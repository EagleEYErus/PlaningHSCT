//
//  SegmentStatusPresenter.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import Foundation

protocol SegmentStatusPresenter {
    var viewModels: [CellViewModel] { get }
}

final class SegmentStatusPresenterImpl: SegmentStatusPresenter {
    private weak var view: SegmentStatusViewController?
    
    var viewModels = [CellViewModel]()
    
    init(view: SegmentStatusViewController) {
        self.view = view
        configureViewModel()
    }
}

extension SegmentStatusPresenterImpl {
    private func configureViewModel() {
        viewModels = [
            RequestStatusViewModel(),
            RequestStatusViewModel(),
            RequestStatusViewModel()
        ]
    }
}
