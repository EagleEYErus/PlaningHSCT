//
//  StatePresenter.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import Foundation

protocol StatePresenter {
    
}

final class StatePresenterImpl: StatePresenter {
    private weak var view: StateViewController?
    
    init(view: StateViewController) {
        self.view = view
    }
}
