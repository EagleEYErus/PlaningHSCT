//
//  DetailDonorMainInfoCellViewModel.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 20.05.2020.
//

import Foundation

final class DetailDonorMainInfoCellViewModel: CellViewModel {
    let identifier: String = DetailDonorMainInfoCell.identifier
    var name: String
    var surname: String
    var patronymic: String
    var kinship: String
    var dateOfBirthday: Date?
    var gender: Gender
    var heightValue: Int
    var weightValue: Int
    
    init(donor: Donor) {
        name = donor.name
        surname = donor.surname
        patronymic = donor.patronymic
        kinship = donor.kinship
        dateOfBirthday = donor.dateOfBirthday
        gender = Gender(rawValue: donor.gender) ?? .null
        heightValue = donor.height
        weightValue = donor.weight
    }
}
