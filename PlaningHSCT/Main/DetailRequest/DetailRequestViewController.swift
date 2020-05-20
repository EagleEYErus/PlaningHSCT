//
//  DetailRequestViewController.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import UIKit

final class DetailRequestViewController: BaseViewController {
    var presenter: DetailRequestPresenter!
    
    private let segmentedControl = UISegmentedControl()
    private let containerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func add(asChildViewController viewController: UIViewController) {
        addChild(viewController)
        containerView.addSubview(viewController.view)
        viewController.view.frame = containerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParent: self)
    }
    
    func remove(asChildViewController viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
    
    @objc
    private func didChangeValueSegmentedControl() {
        presenter.selectSegment(at: segmentedControl.selectedSegmentIndex)
    }
    
    @objc
    private func didTapSaveButton() {
        presenter.saveRequest()
    }
}

extension DetailRequestViewController {
    private func configureView() {
        title = "Новая заявка"
        setupCloseBarButtonItem()
        addSaveBarButtonItem()
        addSegmentedControl()
        addContainerView()
    }
    
    private func addSaveBarButtonItem() {
        let buttonItem = UIBarButtonItem(title: "Сохранить",
                                         style: .done,
                                         target: self,
                                         action: #selector(didTapSaveButton))
        navigationItem.rightBarButtonItem = buttonItem
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
        
        segmentedControl.addTarget(self, action: #selector(didChangeValueSegmentedControl), for: .valueChanged)
    }
    
    private func addContainerView() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        
        containerView.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom).offset(16)
            $0.left.right.bottom.equalToSuperview()
        }
    }
}
