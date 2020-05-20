//
//  Request.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import Foundation
import RealmSwift

final class Request: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var therapyType: Int = TherapyType.null.rawValue
    @objc dynamic var therapyNumber: Int = 0
    @objc dynamic var branchHSCT: Int = BranchHSCT.null.rawValue
    @objc dynamic var detailTherapyType: String = ""
    @objc dynamic var dateTherapy: Date?
    @objc dynamic var datePlannedTherapy: Date?
    @objc dynamic var dateHospitalization: Date?
    @objc dynamic var TBI: Bool = false
    @objc dynamic var TAI: Bool = false
    @objc dynamic var patient: Patient?
    
    dynamic var donors = List<Donor>()
    dynamic var statuses = List<RequestStatus>()
    
    static override func primaryKey() -> String? {
        return "id"
    }
}

extension Request {
    func addDonors(_ donors: [Donor]) {
        for donor in donors {
            self.donors.append(donor)
        }
    }
    
    func addStatuses(_ statuses: [RequestStatus]) {
        for status in statuses {
            self.statuses.append(status)
        }
    }
}
