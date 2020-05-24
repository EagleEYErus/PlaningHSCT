//
//  RequestDateCellsTherapyCell.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import UIKit

final class RequestDateCellsTherapyCell: BaseTableViewCell {
    static let identifier = String(describing: RequestDateCellsTherapyCell.self)
    
    private let datePlaningTherapyView = DropDownTextFieldView()
    private let dateTherapyView = DropDownTextFieldView()
    private let dateHospitalizationView = DropDownTextFieldView()
    
    private weak var viewModel: RequestDateCellsTherapyViewModel? {
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
        datePlaningTherapyView.textField.text = viewModel.datePlannedTherapy?.toString() ?? ""
        dateTherapyView.textField.text = viewModel.dateTherapy?.toString() ?? ""
        dateHospitalizationView.textField.text = viewModel.dateHospitalization?.toString() ?? ""
    }
}

extension RequestDateCellsTherapyCell: BaseCell {
    func set(_ viewModel: CellViewModel) {
        self.viewModel = viewModel as? RequestDateCellsTherapyViewModel
    }
}

extension RequestDateCellsTherapyCell {
    private func configureView() {
        addDatePlaningTherapyView()
        addDateTherapyView()
        addDateHospitalizationView()
    }
    
    private func addDatePlaningTherapyView() {
        datePlaningTherapyView.didSelectDate = { [weak self] date in
            self?.viewModel?.datePlannedTherapy = date
        }
        datePlaningTherapyView.setDatePicker()
        datePlaningTherapyView.label.text = "Планируемая дата клеточной терапии"
        datePlaningTherapyView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(datePlaningTherapyView)
        
        datePlaningTherapyView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.right.equalToSuperview().inset(16)
        }
    }
    
    private func addDateTherapyView() {
        dateTherapyView.didSelectDate = { [weak self] date in
            self?.viewModel?.dateTherapy = date
        }
        dateTherapyView.setDatePicker()
        dateTherapyView.label.text = "Дата клеточной терапии"
        dateTherapyView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dateTherapyView)
        
        dateTherapyView.snp.makeConstraints {
            $0.top.equalTo(datePlaningTherapyView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
        }
    }
    
    private func addDateHospitalizationView() {
        dateHospitalizationView.didSelectDate = { [weak self] date in
            self?.viewModel?.dateHospitalization = date
        }
        dateHospitalizationView.setDatePicker()
        dateHospitalizationView.label.text = "Дата госпитализации"
        dateHospitalizationView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dateHospitalizationView)
        
        dateHospitalizationView.snp.makeConstraints {
            $0.top.equalTo(dateTherapyView.snp.bottom).offset(16)
            $0.left.right.bottom.equalToSuperview().inset(16)
        }
    }
}
