//
//  SegmentDonorViewController.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import UIKit

final class SegmentDonorViewController: BaseViewController {
    var presenter: SegmentDonorPresenter!
    
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
    
    func getDonors() -> [Donor] {
        return presenter.donors
    }
    
    @objc
    private func didTapAddNewDonor() {
        showDetailDonor()
    }
    
    private func showDetailDonor(_ donor: Donor? = nil) {
        let controller = DetailDonorViewController()
        controller.presenter = DetailDonorPresenterImpl(view: controller,
                                                        donor: donor,
                                                        didAddNewDonor: { [weak self] newDonor in
            self?.presenter.addDonor(newDonor)
        })
        presentRoot(controller)
    }
}

extension SegmentDonorViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.donors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let donor = presenter.donors[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RequestDonorCell.identifier,
                                                       for: indexPath) as? RequestDonorCell else {
            return UITableViewCell()
        }
        cell.donor = donor
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showDetailDonor(presenter.donors[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
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

extension SegmentDonorViewController {
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
        
        addingButton.addTarget(self, action: #selector(didTapAddNewDonor), for: .touchUpInside)
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
        
        tableView.register(RequestDonorCell.self, forCellReuseIdentifier: RequestDonorCell.identifier)
    }
}
