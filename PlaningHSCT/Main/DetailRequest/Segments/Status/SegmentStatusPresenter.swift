//
//  SegmentStatusPresenter.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import Foundation

protocol SegmentStatusPresenter {
    
}

final class SegmentStatusPresenterImpl: SegmentStatusPresenter {
    private weak var view: SegmentStatusViewController?
    
    init(view: SegmentStatusViewController) {
        self.view = view
    }
}
