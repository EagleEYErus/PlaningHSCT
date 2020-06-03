//
//  DonorNetworkModel.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 02.06.2020.
//

import Foundation

struct DonorNetworkModel: Codable {
    let id: Int
    let family_name: String?
    let given_name: String?
    let patronymic: String?
    let sex: String?
    let birth_date: String?
    let anti_cmv_igg_id: Int?
    let created_at: String?
    let updated_at: String?
    let mis_id: String?
    let international_id: String?
    let lis_id: String?
    let age: Int?
}
