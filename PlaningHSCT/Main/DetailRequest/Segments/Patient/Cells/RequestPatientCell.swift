//
//  RequestPatientCell.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import UIKit

final class RequestPatientCell: BaseTableViewCell {
    static let identifier = String(describing: RequestPatientCell.self)
    
    private let nameView = TextFieldView()
    private let surnameView = TextFieldView()
    private let patronymicView = TextFieldView()
    private let dateOfBirthdayView = DropDownTextFieldView()
    private let genderView = DropDownTextFieldView()
    private let idMISView = TextFieldView()
    private let idLISView = TextFieldView()
    
    private weak var viewModel: RequestPatientViewModel? {
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
        nameView.textField.text = viewModel.name
        surnameView.textField.text = viewModel.surname
        patronymicView.textField.text = viewModel.patronymic
        dateOfBirthdayView.textField.text = viewModel.dateOfBirthday?.toString() ?? ""
        genderView.textField.text = viewModel.gender.title
        idMISView.textField.text = viewModel.idMIS
        idLISView.textField.text = viewModel.idLIS
    }
}

extension RequestPatientCell: BaseCell {
    func set(_ viewModel: CellViewModel) {
        self.viewModel = viewModel as? RequestPatientViewModel
    }
}

extension RequestPatientCell {
    private func configureView() {
        addNameView()
        addSurnameView()
        addPatronymicView()
        addDateOfBirthdayView()
        addGenderView()
        addIdMISView()
        addIdLISView()
    }
    
    private func addNameView() {
        nameView.didEnd = { [weak self] text in
            self?.viewModel?.name = text
        }
        nameView.label.text = "Имя"
        nameView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameView)
        
        nameView.snp.makeConstraints {
            $0.left.top.right.equalToSuperview().inset(16)
        }
    }
    
    private func addSurnameView() {
        surnameView.didEnd = { [weak self] text in
            self?.viewModel?.surname = text
        }
        surnameView.label.text = "Фамилия"
        surnameView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(surnameView)
        
        surnameView.snp.makeConstraints {
            $0.top.equalTo(nameView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
        }
    }
    
    private func addPatronymicView() {
        patronymicView.didEnd = { [weak self] text in
            self?.viewModel?.patronymic = text
        }
        patronymicView.label.text = "Отчество"
        patronymicView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(patronymicView)
        
        patronymicView.snp.makeConstraints {
            $0.top.equalTo(surnameView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
        }
    }
    
    private func addDateOfBirthdayView() {
        dateOfBirthdayView.didSelectDate = { [weak self] date in
            self?.viewModel?.dateOfBirthday = date
        }
        dateOfBirthdayView.setDatePicker()
        dateOfBirthdayView.label.text = "Дата рождения"
        dateOfBirthdayView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dateOfBirthdayView)
        
        dateOfBirthdayView.snp.makeConstraints {
            $0.top.equalTo(patronymicView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
        }
    }
    
    private func addGenderView() {
        genderView.didSelectValue = { [weak self] index in
            self?.viewModel?.gender = Gender(rawValue: index) ?? .null
        }
        genderView.setPicker(Gender.self)
        genderView.label.text = "Пол"
        genderView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(genderView)
        
        genderView.snp.makeConstraints {
            $0.top.equalTo(dateOfBirthdayView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
        }
    }
    
    private func addIdMISView() {
        idMISView.didEnd = { [weak self] text in
            self?.viewModel?.idMIS = text
        }
        idMISView.label.text = "ID МИС"
        idMISView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(idMISView)
        
        idMISView.snp.makeConstraints {
            $0.top.equalTo(genderView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
        }
    }
    
    private func addIdLISView() {
        idLISView.didEnd = { [weak self] text in
            self?.viewModel?.idLIS = text
        }
        idLISView.label.text = "ID ЛИС"
        idLISView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(idLISView)
        
        idLISView.snp.makeConstraints {
            $0.top.equalTo(idMISView.snp.bottom).offset(16)
            $0.left.bottom.right.equalToSuperview().inset(16)
        }
    }
}
