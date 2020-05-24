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
    
    func reloadTableView() {
        setupTitle()
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    @objc
    private func didTapAddingNewRequest() {
        showDetailRequest()
    }
    
    private func showDetailRequest(_ request: Request? = nil) {
        let view = DetailRequestViewController()
        view.presenter = DetailRequestPresenterImpl(view: view, request: request)
        presentRoot(view)
    }
}

extension RequestsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.requests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RequestCell.identifier,
                                                       for: indexPath) as? RequestCell else {
            return UITableViewCell()
        }
        cell.request = presenter.requests[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let request = presenter.requests[indexPath.row]
        DispatchQueue.main.async { [weak self] in
            self?.showDetailRequest(request)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presenter.deleteRequest(at: indexPath.row)
            setupTitle()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
}

extension RequestsViewController {
    private func configureView() {
        setupTitle()
        addAddingNewRequestBarButtonItem()
        addTableView()
    }
    
    private func setupTitle() {
        title = "Заявки (\(presenter.requests.count))"
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
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        tableView.register(RequestCell.self, forCellReuseIdentifier: RequestCell.identifier)
    }
}
