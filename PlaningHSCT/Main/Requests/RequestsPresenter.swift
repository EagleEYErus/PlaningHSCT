//
//  RequestsPresenter.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import Foundation

protocol RequestsPresenter {
    
}

final class RequestsPresenterImpl: RequestsPresenter {
    private weak var view: RequestsViewController?
    
    init(view: RequestsViewController) {
        self.view = view
    }
}
