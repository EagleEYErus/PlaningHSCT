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
    
    var viewModels = [CellViewModel]()
    
    init(view: SegmentRequestViewController) {
        self.view = view
        configureViewModel()
    }
}

extension SegmentRequestPresenterImpl {
    private func configureViewModel() {
        viewModels = [
            RequestCellsTherapyViewModel(),
            RequestDateCellsTherapyViewModel()
        ]
    }
}
