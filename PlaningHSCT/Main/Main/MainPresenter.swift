//
//  MainPresenter.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 17.05.2020.
//

import Foundation

protocol MainPresenter {
    
}

final class MainPresenterImpl: MainPresenter {
    private weak var view: MainViewController?
    
    init(view: MainViewController) {
        self.view = view
    }
}
