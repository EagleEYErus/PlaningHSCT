//
//  DetailDonorViewController.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 20.05.2020.
//

import UIKit

final class DetailDonorViewController: BaseViewController {
    var presenter: DetailDonorPresenter!
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    @objc
    private func didTapSaveButton() {
        view.endEditing(true)
        presenter.saveDonor()
    }
}

extension DetailDonorViewController: UITableViewDelegate, UITableViewDataSource {
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

extension DetailDonorViewController {
    private func configureView() {
        title = "Донор"
        setupCloseBarButtonItem()
        addSaveBarButtonItem()
        addTableView()
    }
    
    private func addSaveBarButtonItem() {
        let buttonItem = UIBarButtonItem(title: "Сохранить",
                                         style: .done,
                                         target: self,
                                         action: #selector(didTapSaveButton))
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
        
        tableView.register(DetailDonorOtherInfoCell.self, forCellReuseIdentifier: DetailDonorOtherInfoCell.identifier)
        tableView.register(DetailDonorMainInfoCell.self, forCellReuseIdentifier: DetailDonorMainInfoCell.identifier)
    }
}
