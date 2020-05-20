//
//  RequestStatusViewModel.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import Foundation

final class RequestStatusViewModel: CellViewModel {
    let identifier: String = RequestStatusCell.identifier
    var status: RequestStatusType
    var date: Date?
    
    init(status: RequestStatus) {
        self.status = RequestStatusType(rawValue: status.status) ?? .null
        self.date = status.date
    }
}
