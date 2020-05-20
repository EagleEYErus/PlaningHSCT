//
//  TextFieldView.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import UIKit

final class DropDownTextFieldView: UIView {
    private var pickerValues = [String]()
    private lazy var datePicker = DatePicker()
    private lazy var pickerView = PickerView()
    
    let label = UILabel()
    let textField = DropDownTextField()
    
    var didSelectValue: ((Int) -> Void)?
    var didSelectDate: ((Date) -> Void)?
    
    init() {
        super.init(frame: .zero)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPicker<T: BaseCaseIterable>(_ type: T.Type) {
        pickerView.delegate = self
        pickerView.dataSource = self
        
        textField.inputView = pickerView
        for typeCase in type.allCases {
            pickerValues.append(typeCase.title)
        }
        pickerView.reloadAllComponents()
    }
    
    func setDatePicker() {
        textField.inputView = datePicker
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
    }
    
    @objc
    private func datePickerValueChanged() {
        let date = datePicker.date
        textField.text = date.toString()
        didSelectDate?(date)
    }
}

extension DropDownTextFieldView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerValues[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = pickerValues[row]
        didSelectValue?(row)
    }
}

extension DropDownTextFieldView {
    private func configureView() {
        addLabel()
        addTextField()
    }
    
    private func addLabel() {
        label.font = .primaryFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
        label.snp.makeConstraints {
            $0.left.top.right.equalToSuperview()
        }
    }
    
    private func addTextField() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        
        textField.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(8)
            $0.height.equalTo(36)
            $0.left.bottom.right.equalToSuperview()
        }
    }
}
