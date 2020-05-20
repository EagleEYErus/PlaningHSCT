//
//  Gender.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import Foundation

enum Gender: Int, BaseCaseIterable {
    case null
    case male
    case female
    
    var title: String {
        switch self {
        case .male:
            return "Мужчина"
        case .female:
            return "Женщина"
        case .null:
            return ""
        }
    }
}
