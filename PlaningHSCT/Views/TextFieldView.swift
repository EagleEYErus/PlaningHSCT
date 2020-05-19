//
//  TextFieldView.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import UIKit

final class TextFieldView: UIView {
    let label = UILabel()
    let textField = DropDownTextField()
    
    init() {
        super.init(frame: .zero)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TextFieldView {
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
