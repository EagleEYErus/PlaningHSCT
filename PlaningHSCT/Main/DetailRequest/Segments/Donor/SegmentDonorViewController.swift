//
//  SegmentDonorViewController.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import UIKit

final class SegmentDonorViewController: BaseViewController {
    private var presenter: SegmentDonorPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SegmentDonorPresenterImpl(view: self)
        configureView()
    }
}

extension SegmentDonorViewController {
    private func configureView() {
        
    }
}
