//
//  MainViewController.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 17.05.2020.
//

import UIKit

final class MainViewController: BaseViewController {
    private var presenter: MainPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MainPresenterImpl(view: self)
        configureView()
    }
}

extension MainViewController {
    private func configureView() {
        
    }
}
