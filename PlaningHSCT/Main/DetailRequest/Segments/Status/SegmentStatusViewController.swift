//
//  SegmentStatusViewController.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import UIKit

final class SegmentStatusViewController: BaseViewController {
    var presenter: SegmentStatusPresenter!
    
    private let addingButton = PrimaryButton()
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func reloadTableView() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func getStatuses() -> [RequestStatus] {
        return presenter.getStatuses()
    }
    
    @objc
    private func didTapAddNewStatus() {
        presenter.createNewStatus()
    }
}

extension SegmentStatusViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = presenter.viewModels[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.identifier,
                                                       for: indexPath) as? BaseCell else {
            return UITableViewCell()
        }
        cell.set(viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return presenter.viewModels[indexPath.row].height
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

extension SegmentStatusViewController {
    private func configureView() {
        addAddingButton()
        addTableView()
    }
    
    private func addAddingButton() {
        addingButton.setTitle("Добавить", for: .normal)
        addingButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addingButton)
        
        addingButton.snp.makeConstraints {
            $0.left.top.equalToSuperview().inset(16)
            $0.height.equalTo(36)
            $0.width.equalTo(160)
        }
        
        addingButton.addTarget(self, action: #selector(didTapAddNewStatus), for: .touchUpInside)
    }
    
    private func addTableView() {
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(addingButton.snp.bottom).offset(16)
            $0.left.bottom.right.equalToSuperview()
        }
        
        tableView.register(RequestStatusCell.self, forCellReuseIdentifier: RequestStatusCell.identifier)
    }
}
