//
//  RequestDateCellsTherapyViewModel.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import Foundation

final class RequestDateCellsTherapyViewModel: CellViewModel {
    let identifier: String = RequestDateCellsTherapyCell.identifier
    var datePlannedTherapy: Date?
    var dateTherapy: Date?
    var dateHospitalization: Date?
    var TBI: Bool
    var TAI: Bool
    
    init(request: Request) {
        datePlannedTherapy = request.datePlannedTherapy
        dateTherapy = request.dateTherapy
        dateHospitalization = request.dateHospitalization
        TBI = request.TBI
        TAI = request.TAI
    }
}
