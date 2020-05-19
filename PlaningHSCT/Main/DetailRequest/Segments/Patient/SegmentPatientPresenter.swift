//
//  SegmentPatientPresenter.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import Foundation

protocol SegmentPatientPresenter {
    
}

final class SegmentPatientPresenterImpl: SegmentPatientPresenter {
    private weak var view: SegmentPatientViewController?
    
    init(view: SegmentPatientViewController) {
        self.view = view
    }
}
