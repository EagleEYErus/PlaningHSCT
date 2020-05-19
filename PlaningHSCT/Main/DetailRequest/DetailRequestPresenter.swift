//
//  DetailRequestPresenter.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import Foundation

protocol DetailRequestPresenter {
    
}

final class DetailRequestPresenterImpl: DetailRequestPresenter {
    private weak var view: DetailRequestViewController?
    
    init(view: DetailRequestViewController) {
        self.view = view
    }
}
