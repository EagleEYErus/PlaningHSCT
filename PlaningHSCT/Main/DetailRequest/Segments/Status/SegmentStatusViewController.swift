//
//  SegmentStatusViewController.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import UIKit

final class SegmentStatusViewController: BaseViewController {
    private var presenter: SegmentStatusPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SegmentStatusPresenterImpl(view: self)
        configureView()
    }
}

extension SegmentStatusViewController {
    private func configureView() {
        
    }
}
