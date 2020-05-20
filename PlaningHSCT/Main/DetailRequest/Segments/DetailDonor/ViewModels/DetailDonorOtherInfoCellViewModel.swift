//
//  DetailDonorOtherInfoCellViewModel.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 20.05.2020.
//

import Foundation

final class DetailDonorOtherInfoCellViewModel: CellViewModel {
    let identifier: String = DetailDonorOtherInfoCell.identifier
    var idMIS: String
    var idLIS: String
    var idInternational: String
    var country: String
    var statusCMV: String
    var bloodType: String
    var numberPregnancies: Int
    var donorType: String
    var transplantType: String
    var isOK: Bool
    var solution: String
    var dateMaterials: Date?
    
    init(donor: Donor) {
        idMIS = donor.idMIS
        idLIS = donor.idLIS
        idInternational = donor.idInternational
        country = donor.country
        statusCMV = donor.statusCMV
        bloodType = donor.bloodType
        numberPregnancies = donor.numberPregnancies
        donorType = donor.donorType
        transplantType = donor.transplantType
        isOK = donor.isOK
        solution = donor.solution
        dateMaterials = donor.dateMaterials
    }
}
