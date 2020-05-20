//
//  PrimaryButton.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import UIKit

final class PrimaryButton: UIButton {
    init() {
        super.init(frame: .zero)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PrimaryButton {
    private func configureView() {
        setTitleColor(.systemBlue, for: .normal)
        titleLabel?.font = .primaryFont(ofSize: 16, weight: .bold)
        layer.cornerRadius = 8
        layer.borderColor = UIColor.systemBlue.cgColor
        layer.borderWidth = 2
        clipsToBounds = true
    }
}
