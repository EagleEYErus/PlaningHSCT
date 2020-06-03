//
//  DonorshipNetworkModel.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 02.06.2020.
//

import Foundation

struct DonorshipNetworkModel: Codable {
    let id: Int
    let request_id: Int
    let donor_id: Int
    let approved: Bool?
    let type_id: Int?
    let created_at: String?
    let updated_at: String?
    let weight: Double?
    let blood_type_id: Int?
    let pregnancies_count: Int?
    let material_draw_date: String?
    let country: String?
    let relationship_id: Int?
    let is_hla_typed: Bool?
    let transplant_type_id: Int?
    let valid_donor: Bool?
    let height: Double?
    let body_mass_index: Double?
    let type_short: String?
    let type_approved: String?
    let type_valid: String?
}
