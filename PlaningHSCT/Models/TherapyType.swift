//
//  TherapyType.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import Foundation

enum TherapyType: Int, BaseCaseIterable {
    case null
    case autologous
    case allogeneic
    
    var title: String {
        switch self {
        case .autologous:
            return "Аутологичная"
        case .allogeneic:
            return "Аллогенная"
        case .null:
            return ""
        }
    }
    
    var name: String {
        switch self {
        case .autologous:
            return "АУТО"
        case .allogeneic:
            return "АЛЛО"
        case .null:
            return ""
        }
    }
}

enum NumberTherapyType: Int, BaseCaseIterable {
    case null
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    
    var title: String {
        if self == .null {
            return ""
        }
        return self.rawValue.toString()
    }
}
