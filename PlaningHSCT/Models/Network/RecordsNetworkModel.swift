//
//  RecordsNetworkModel.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 02.06.2020.
//

import Foundation

struct RecordsNetworkModel: Codable {
    let requests: [RequestNetworkModel]
    let patients: [PatientNetworkModel]
    let donorships: [DonorshipNetworkModel]
    let donors: [DonorNetworkModel]
}
