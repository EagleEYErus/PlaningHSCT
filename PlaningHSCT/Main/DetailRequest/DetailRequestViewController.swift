//
//  DetailRequestViewController.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import UIKit

final class DetailRequestViewController: BaseViewController {
    private var presenter: DetailRequestPresenter!
    
    private let segmentedControl = UISegmentedControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = DetailRequestPresenterImpl(view: self)
        configureView()
    }
}

extension DetailRequestViewController {
    private func configureView() {
        title = "Новая заявка"
        setupCloseBarButtonItem()
        addSegmentedControl()
    }
    
    private func addSegmentedControl() {
        segmentedControl.insertSegment(withTitle: "Заявка", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "Статусы", at: 1, animated: false)
        segmentedControl.insertSegment(withTitle: "Пациент", at: 2, animated: false)
        segmentedControl.insertSegment(withTitle: "Доноры", at: 3, animated: false)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        segmentedControl.snp.makeConstraints {
            $0.left.top.right.equalToSuperview().inset(16)
        }
    }
}
