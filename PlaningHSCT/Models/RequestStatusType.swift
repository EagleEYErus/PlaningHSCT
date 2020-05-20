//
//  RequestStatusType.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import Foundation

protocol BaseCaseIterable: CaseIterable {
    var title: String { get }
}

enum RequestStatusType: Int, BaseCaseIterable {
    case null
    case new
    case newMIS
    case newMISCGM
    case pendingReview
    case HRHLA
    case HLA
    case rejected
    case search
    case donorApproved
    
    var title: String {
        switch self {
        case .new:
            return "Новая заявка"
        case .newMIS:
            return "Новая заявка МИС"
        case .newMISCGM:
            return "Новая заявка МИС CGM"
        case .pendingReview:
            return "Рассмотрение отложено"
        case .HRHLA:
            return "HR HLA - типирование родственных доноров"
        case .HLA:
            return "HLA - типирование сиблингов"
        case .rejected:
            return "Заявка отклонена"
        case .search:
            return "Поиск неродственного донора"
        case .donorApproved:
            return "Донор утвержден"
        case .null:
            return ""
        }
    }
}
