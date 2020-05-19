//
//  RequestsViewController.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import UIKit

final class RequestsViewController: BaseViewController {
    private var presenter: RequestsPresenter!
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = RequestsPresenterImpl(view: self)
        configureView()
    }
    
    @objc
    private func didTapAddingNewRequest() {
        let controller = DetailRequestViewController()
        presentRoot(controller)
    }
}

extension RequestsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension RequestsViewController {
    private func configureView() {
        title = "Заявки"
        addAddingNewRequestBarButtonItem()
        addTableView()
    }
    
    private func addAddingNewRequestBarButtonItem() {
        let buttonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                         target: self,
                                         action: #selector(didTapAddingNewRequest))
        navigationItem.rightBarButtonItem = buttonItem
    }
    
    private func addTableView() {
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
