//
//  DetailDonorMainInfoCell.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 20.05.2020.
//

import UIKit

final class DetailDonorMainInfoCell: BaseTableViewCell {
    static let identifier = String(describing: DetailDonorMainInfoCell.self)
    
    private let nameView = TextFieldView()
    private let surnameView = TextFieldView()
    private let patronymicView = TextFieldView()
    private let dateOfBirthdayView = DropDownTextFieldView()
    private let genderView = DropDownTextFieldView()
    private let kinshipView = TextFieldView()
    private let heightView = TextFieldView()
    private let weightView = TextFieldView()
    
    private weak var viewModel: DetailDonorMainInfoCellViewModel? {
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
        kinshipView.textField.text = viewModel.kinship
        heightView.textField.text = "\(viewModel.heightValue)"
        weightView.textField.text = "\(viewModel.weightValue)"
    }
}

extension DetailDonorMainInfoCell: BaseCell {
    func set(_ viewModel: CellViewModel) {
        self.viewModel = viewModel as? DetailDonorMainInfoCellViewModel
    }
}

extension DetailDonorMainInfoCell {
    private func configureView() {
        addNameView()
        addSurnameView()
        addPatronymicView()
        addDateOfBirthdayView()
        addGenderView()
        addKinshipView()
        addHeightView()
        addWeightView()
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
    
    private func addKinshipView() {
        kinshipView.didEnd = { [weak self] text in
            self?.viewModel?.kinship = text
        }
        kinshipView.label.text = "Родство"
        kinshipView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(kinshipView)

        kinshipView.snp.makeConstraints {
            $0.top.equalTo(genderView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
        }
    }
    
    private func addHeightView() {
        heightView.didEnd = { [weak self] text in
            self?.viewModel?.heightValue = Int(text) ?? 0
        }
        heightView.label.text = "Рост, см"
        heightView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(heightView)

        heightView.snp.makeConstraints {
            $0.top.equalTo(kinshipView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
        }
    }
    
    private func addWeightView() {
        weightView.didEnd = { [weak self] text in
            self?.viewModel?.weightValue = Int(text) ?? 0
        }
        weightView.label.text = "Масса тела, кг"
        weightView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(weightView)

        weightView.snp.makeConstraints {
            $0.top.equalTo(heightView.snp.bottom).offset(16)
            $0.left.bottom.right.equalToSuperview().inset(16)
        }
    }
}
