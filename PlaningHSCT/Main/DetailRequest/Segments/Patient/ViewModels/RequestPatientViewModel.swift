//
//  RequestPatientViewModel.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import Foundation

final class RequestPatientViewModel: CellViewModel {
    let identifier: String = RequestPatientCell.identifier
    var name: String
    var surname: String
    var patronymic: String
    var dateOfBirthday: Date?
    var gender: Gender
    var idMIS: String
    var idLIS: String
    
    init(patient: Patient) {
        name = patient.name
        surname = patient.surname
        patronymic = patient.patronymic
        dateOfBirthday = patient.dateOfBirthday
        gender = Gender(rawValue: patient.gender) ?? .null
        idMIS = patient.idMIS
        idLIS = patient.idLIS
    }
}
