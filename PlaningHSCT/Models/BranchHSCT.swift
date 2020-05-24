//
//  BranchHSCT.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import Foundation

enum BranchHSCT: Int, BaseCaseIterable {
    case null
    case hospital
    case registry
    case doctorsOffices
    case HSCTOne
    case HSCTTwo
    case pediatricHematologyAndOncology
    case oncohematology
    case clinicalOncology
    case immunology
    case hematologyOncologyAdolescentsAndYouth
    case boxedHematologyOncology
    case surgeryChildrenAndAdolescents
    case intensiveCareUnit
    case receptionOffice
    case paraclinic
    
    var title: String {
        switch self {
        case .hospital:
            return "Стационар"
        case .registry:
            return "Регистратура"
        case .doctorsOffices:
            return "Кабинеты врачей"
        case .HSCTOne:
            return "Отделение ТГСК №1"
        case .HSCTTwo:
            return "Отделение ТГСК №2"
        case .pediatricHematologyAndOncology:
            return "Отделение детской гематологии и онкологии"
        case .oncohematology:
            return "Отделение онкогематологии"
        case .clinicalOncology:
            return "Отделение клинической онкологии"
        case .immunology:
            return "Отделение иммунологии"
        case .hematologyOncologyAdolescentsAndYouth:
            return "Отделение гематологии/онкологии для подростков и молодежи"
        case .boxedHematologyOncology:
            return "Боксированное отделение гематологии/онкологии"
        case .surgeryChildrenAndAdolescents:
            return "Отделение хирургии детей и подростков"
        case .intensiveCareUnit:
            return "Отделение реанимации и интенсивной терапии"
        case .receptionOffice:
            return "Приемное отделение"
        case .paraclinic:
            return "Параклиника"
        case .null:
            return ""
        }
    }
}
