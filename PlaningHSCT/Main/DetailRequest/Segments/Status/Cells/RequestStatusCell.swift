//
//  RequestStatusCell.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import UIKit

final class RequestStatusCell: BaseTableViewCell {
    static let identifier = String(describing: RequestStatusCell.self)
    
    private let statusView = DropDownTextFieldView()
    private let dateStatusView = DropDownTextFieldView()
    
    private weak var viewModel: RequestStatusViewModel? {
        didSet {
            updateView()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateView() {
        guard let viewModel = viewModel else {
            return
        }
        statusView.textField.text = viewModel.status.title
        dateStatusView.textField.text = viewModel.date?.toString() ?? ""
    }
}

extension RequestStatusCell: BaseCell {
    func set(_ viewModel: CellViewModel) {
        self.viewModel = viewModel as? RequestStatusViewModel
    }
}

extension RequestStatusCell {
    private func configureView() {
        addStatusView()
        addDateStatusView()
    }
    
    private func addStatusView() {
        statusView.didSelectValue = { [weak self] index in
            self?.viewModel?.status = RequestStatusType(rawValue: index) ?? .null
        }
        statusView.setPicker(RequestStatusType.self)
        statusView.label.text = "Статус"
        statusView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(statusView)
        
        statusView.snp.makeConstraints {
            $0.left.top.right.equalToSuperview().inset(16)
        }
    }
    
    private func addDateStatusView() {
        dateStatusView.didSelectDate = { [weak self] date in
            self?.viewModel?.date = date
        }
        dateStatusView.setDatePicker()
        dateStatusView.label.text = "Дата"
        dateStatusView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dateStatusView)
        
        dateStatusView.snp.makeConstraints {
            $0.top.equalTo(statusView.snp.bottom).offset(16)
            $0.left.bottom.equalToSuperview().inset(16)
            $0.width.equalTo(180)
        }
    }
}

