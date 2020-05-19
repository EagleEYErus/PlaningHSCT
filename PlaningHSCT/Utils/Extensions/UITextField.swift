//
//  UITextField.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import UIKit

extension UITextField {
    func addLeftTextMargin(_ margin: CGFloat) {
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: margin, height: frame.height))
        leftViewMode = .always
    }
}
