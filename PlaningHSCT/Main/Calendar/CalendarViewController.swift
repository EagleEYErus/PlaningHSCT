//
//  CalendarViewController.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import UIKit

final class CalendarViewController: BaseViewController {
    private var presenter: CalendarPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = CalendarPresenterImpl(view: self)
        configureView()
    }
}

extension CalendarViewController {
    private func configureView() {
        title = "Календарь"
    }
}
