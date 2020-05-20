//
//  DatePickerView.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 20.05.2020.
//

import UIKit

final class DatePicker: UIDatePicker {
    init() {
        super.init(frame: .zero)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DatePicker {
    private func configureView() {
        backgroundColor = .white
        datePickerMode = .date
        locale = Locale(identifier: "RU")
        setDate(Date(), animated: false)
    }
}
