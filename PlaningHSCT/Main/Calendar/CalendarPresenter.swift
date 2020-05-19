//
//  CalendarPresenter.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import Foundation

protocol CalendarPresenter {
    
}

final class CalendarPresenterImpl: CalendarPresenter {
    private weak var view: CalendarViewController?
    
    init(view: CalendarViewController) {
        self.view = view
    }
}
