//
//  DetailDonorOtherInfoCell.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 20.05.2020.
//

import UIKit

final class DetailDonorOtherInfoCell: BaseTableViewCell {
    static let identifier = String(describing: DetailDonorOtherInfoCell.self)
    
    private let idMISView = TextFieldView()
    private let idLISView = TextFieldView()
    private let idInternationalView = TextFieldView()
    private let countryView = TextFieldView()
    private let statusCMVView = TextFieldView()
    private let bloodTypeView = TextFieldView()
    private let numberPregnanciesView = TextFieldView()
    private let donorTypeView = TextFieldView()
    private let transplantTypeView = TextFieldView()
    private let solutionView = TextFieldView()
    private let dateMaterialsView = DropDownTextFieldView()
    
    private weak var viewModel: DetailDonorOtherInfoCellViewModel? {
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
        idMISView.textField.text = viewModel.idMIS
        idLISView.textField.text = viewModel.idLIS
        idInternationalView.textField.text = viewModel.idInternational
        countryView.textField.text = viewModel.country
        statusCMVView.textField.text = viewModel.statusCMV
        bloodTypeView.textField.text = viewModel.bloodType
        numberPregnanciesView.textField.text = "\(viewModel.numberPregnancies)"
        donorTypeView.textField.text = viewModel.donorType
        transplantTypeView.textField.text = viewModel.transplantType
        solutionView.textField.text = viewModel.solution
        dateMaterialsView.textField.text = viewModel.dateMaterials?.toString() ?? ""
    }
}

extension DetailDonorOtherInfoCell: BaseCell {
    func set(_ viewModel: CellViewModel) {
        self.viewModel = viewModel as? DetailDonorOtherInfoCellViewModel
    }
}

extension DetailDonorOtherInfoCell {
    private func configureView() {
        addIdMISView()
        addIdLISView()
        addIdInternationalView()
        addCountryView()
        addStatusCMVView()
        addBloodTypeView()
        addNumberPregnanciesView()
        addDonorTypeView()
        addTransplantTypeView()
        addSolutionView()
        addDateMaterialsView()
    }
    
    private func addIdMISView() {
        idMISView.didEnd = { [weak self] text in
            self?.viewModel?.idMIS = text
        }
        idMISView.label.text = "ID донора в МИС"
        idMISView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(idMISView)

        idMISView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.right.equalToSuperview().inset(16)
        }
    }

    private func addIdLISView() {
        idLISView.didEnd = { [weak self] text in
            self?.viewModel?.idLIS = text
        }
        idLISView.label.text = "ID донора в ЛИС"
        idLISView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(idLISView)

        idLISView.snp.makeConstraints {
            $0.top.equalTo(idMISView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
        }
    }

    private func addIdInternationalView() {
        idInternationalView.didEnd = { [weak self] text in
            self?.viewModel?.idInternational = text
        }
        idInternationalView.label.text = "Международный ID донора"
        idInternationalView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(idInternationalView)

        idInternationalView.snp.makeConstraints {
            $0.top.equalTo(idLISView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
        }
    }

    private func addCountryView() {
        countryView.didEnd = { [weak self] text in
            self?.viewModel?.country = text
        }
        countryView.label.text = "Страна нахождения донора"
        countryView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(countryView)

        countryView.snp.makeConstraints {
            $0.top.equalTo(idInternationalView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
        }
    }

    private func addStatusCMVView() {
        statusCMVView.didEnd = { [weak self] text in
            self?.viewModel?.statusCMV = text
        }
        statusCMVView.label.text = "CMV статус"
        statusCMVView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(statusCMVView)

        statusCMVView.snp.makeConstraints {
            $0.top.equalTo(countryView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
        }
    }
    
    private func addBloodTypeView() {
        bloodTypeView.didEnd = { [weak self] text in
            self?.viewModel?.bloodType = text
        }
        bloodTypeView.label.text = "Группа крови"
        bloodTypeView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bloodTypeView)

        bloodTypeView.snp.makeConstraints {
            $0.top.equalTo(statusCMVView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
        }
    }
    
    private func addNumberPregnanciesView() {
        numberPregnanciesView.didEnd = { [weak self] text in
            self?.viewModel?.numberPregnancies = Int(text) ?? 0
        }
        numberPregnanciesView.label.text = "Количество беременностей"
        numberPregnanciesView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(numberPregnanciesView)

        numberPregnanciesView.snp.makeConstraints {
            $0.top.equalTo(bloodTypeView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
        }
    }
    
    private func addDonorTypeView() {
        donorTypeView.didEnd = { [weak self] text in
            self?.viewModel?.donorType = text
        }
        donorTypeView.label.text = "Тип донора"
        donorTypeView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(donorTypeView)

        donorTypeView.snp.makeConstraints {
            $0.top.equalTo(numberPregnanciesView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
        }
    }
    
    private func addTransplantTypeView() {
        transplantTypeView.didEnd = { [weak self] text in
            self?.viewModel?.transplantType = text
        }
        transplantTypeView.label.text = "Тип трансплантата"
        transplantTypeView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(transplantTypeView)

        transplantTypeView.snp.makeConstraints {
            $0.top.equalTo(donorTypeView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
        }
    }
    
    private func addSolutionView() {
        solutionView.didEnd = { [weak self] text in
            self?.viewModel?.solution = text
        }
        solutionView.label.text = "Решение"
        solutionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(solutionView)

        solutionView.snp.makeConstraints {
            $0.top.equalTo(transplantTypeView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
        }
    }
    
    private func addDateMaterialsView() {
        dateMaterialsView.didSelectDate = { [weak self] date in
            self?.viewModel?.dateMaterials = date
        }
        dateMaterialsView.setDatePicker()
        dateMaterialsView.label.text = "Дата забора материала"
        dateMaterialsView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dateMaterialsView)

        dateMaterialsView.snp.makeConstraints {
            $0.top.equalTo(solutionView.snp.bottom).offset(16)
            $0.left.bottom.right.equalToSuperview().inset(16)
        }
    }
}
