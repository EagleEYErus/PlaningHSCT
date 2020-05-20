//
//  RequestCellsTherapyViewModel.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import Foundation

final class RequestCellsTherapyViewModel: CellViewModel {
    let identifier: String = RequestCellsTherapyCell.identifier
    var therapyType: Int
    var therapyNumber: Int
    var branchHSCT: Int
    var detailTherapyType: String
    
    init(request: Request) {
        therapyType = request.therapyType
        therapyNumber = request.therapyNumber
        branchHSCT = request.branchHSCT
        detailTherapyType = request.detailTherapyType
    }
}
