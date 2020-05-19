//
//  SegmentPatientViewController.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import UIKit

final class SegmentPatientViewController: BaseViewController {
    private var presenter: SegmentPatientPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SegmentPatientPresenterImpl(view: self)
        configureView()
    }
}

extension SegmentPatientViewController {
    private func configureView() {
        
    }
}
