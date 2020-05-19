//
//  DropDownTextField.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import UIKit

final class DropDownTextField: UITextField {
    init() {
        super.init(frame: .zero)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DropDownTextField {
    private func configureView() {
        backgroundColor = .white
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor.grayHeather.cgColor
        clipsToBounds = true
        font = .primaryFont(ofSize: 16)
        textColor = .black
        
        addDropToRight()
        addLeftTextMargin(10)
    }
    
    private func addDropToRight() {
        let dropDownContentView = UIView()
        let dropDownImageView = UIImageView(image: #imageLiteral(resourceName: "drop-down"))
        dropDownContentView.frame = CGRect(
            x: 0, y: 0, width: dropDownImageView.frame.width + 12, height: dropDownImageView.frame.height
        )
        dropDownContentView.addSubview(dropDownImageView)
        rightView = dropDownContentView
        rightViewMode = .always
        rightView?.isUserInteractionEnabled = false
    }
}
