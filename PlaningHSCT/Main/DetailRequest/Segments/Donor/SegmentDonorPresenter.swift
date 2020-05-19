//
//  SegmentDonorPresenter.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import Foundation

protocol SegmentDonorPresenter {
    
}

final class SegmentDonorPresenterImpl: SegmentDonorPresenter {
    private weak var view: SegmentDonorViewController?
    
    init(view: SegmentDonorViewController) {
        self.view = view
    }
}
