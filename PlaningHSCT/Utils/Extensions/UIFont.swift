//
//  UIFont.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 17.05.2020.
//

import UIKit

extension UIFont {
    class func primaryFont(ofSize: CGFloat, weight: UIFont.Weight = .regular) -> UIFont {
        return UIFont.systemFont(ofSize: ofSize, weight: weight)
    }
}
