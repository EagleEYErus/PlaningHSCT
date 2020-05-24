//
//  ReqestCellsTherapyCell.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import UIKit

final class RequestCellsTherapyCell: BaseTableViewCell {
    static let identifier = String(describing: RequestCellsTherapyCell.self)
    
    private let therapyTypeView = DropDownTextFieldView()
    private let therapyNumberView = DropDownTextFieldView()
    private let branchHSCTView = DropDownTextFieldView()
    private let detailTherapyTypeView = DropDownTextFieldView()
    
    private weak var viewModel: RequestCellsTherapyViewModel? {
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
        
    }
}

extension RequestCellsTherapyCell: BaseCell {
    func set(_ viewModel: CellViewModel) {
        self.viewModel = viewModel as? RequestCellsTherapyViewModel
    }
}

extension RequestCellsTherapyCell {
    private func configureView() {
        addTherapyTypeView()
        addTherapyNumberView()
        addBranchHSCTView()
        addDetailTherapyTypeView()
    }
    
    private func addTherapyTypeView() {
        therapyTypeView.didSelectValue = { [weak self] index in
            self?.viewModel?.therapyType = index
        }
        therapyTypeView.setPicker(TherapyType.self)
        therapyTypeView.label.text = "Вид клеточной терапии"
        therapyTypeView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(therapyTypeView)
        
        therapyTypeView.snp.makeConstraints {
            $0.left.top.right.equalToSuperview().inset(16)
        }
    }
    
    private func addTherapyNumberView() {
        therapyNumberView.didSelectValue = { [weak self] index in
            self?.viewModel?.therapyNumber = index
        }
        therapyNumberView.setPicker(NumberTherapyType.self)
        therapyNumberView.label.text = "Номер клеточной терапии"
        therapyNumberView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(therapyNumberView)
        
        therapyNumberView.snp.makeConstraints {
            $0.top.equalTo(therapyTypeView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
        }
    }
    
    private func addBranchHSCTView() {
        branchHSCTView.didSelectValue = { [weak self] index in
            self?.viewModel?.branchHSCT = index
        }
        branchHSCTView.setPicker(BranchHSCT.self)
        branchHSCTView.label.text = "Отделение ТГСК"
        branchHSCTView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(branchHSCTView)
        
        branchHSCTView.snp.makeConstraints {
            $0.top.equalTo(therapyNumberView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
        }
    }
    
    private func addDetailTherapyTypeView() {
        detailTherapyTypeView.label.text = "Уточнение вида клеточной терапии"
        detailTherapyTypeView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(detailTherapyTypeView)
        
        detailTherapyTypeView.snp.makeConstraints {
            $0.top.equalTo(branchHSCTView.snp.bottom).offset(16)
            $0.left.right.bottom.equalToSuperview().inset(16)
        }
    }
}
