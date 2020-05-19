//
//  StateViewController.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import UIKit

final class StateViewController: BaseViewController {
    private var presenter: StatePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = StatePresenterImpl(view: self)
        configureView()
    }
}

extension StateViewController {
    private func configureView() {
        title = "Состояние"
    }
}
