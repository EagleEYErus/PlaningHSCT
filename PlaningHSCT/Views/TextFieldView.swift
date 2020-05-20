//
//  TextFieldView.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 20.05.2020.
//

import UIKit

final class TextFieldView: UIView {
    let label = UILabel()
    let textField = UITextField()
    
    var didEnd: ((String) -> Void)?
    
    init() {
        super.init(frame: .zero)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func didEndEditing() {
        didEnd?(textField.text ?? "")
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
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.grayHeather.cgColor
        textField.clipsToBounds = true
        textField.font = .primaryFont(ofSize: 16)
        textField.textColor = .black
        textField.addLeftTextMargin(10)
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        
        textField.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(8)
            $0.height.equalTo(36)
            $0.left.bottom.right.equalToSuperview()
        }
        
        textField.addTarget(self, action: #selector(didEndEditing), for: .editingDidEnd)
    }
}

