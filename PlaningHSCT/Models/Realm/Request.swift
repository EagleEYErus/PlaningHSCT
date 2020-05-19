//
//  Request.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import Foundation
import RealmSwift

final class Request: Object {
    @objc dynamic let id: String = UUID().uuidString
    @objc dynamic var therapyType: Int = TherapyType.null.rawValue
    @objc dynamic var therapyNumber: Int = 0
    @objc dynamic var branchHSCT: Int = BranchHSCT.null.rawValue
    @objc dynamic var dateTherapy: Date?
    @objc dynamic var plannedDateTherapy: Date?
    @objc dynamic var hospitalizationDate: Date?
    @objc dynamic var TBI: Bool = false
    @objc dynamic var TAI: Bool = false
    
    dynamic var patient: Patient?
    dynamic var donors = List<Donor>()
    dynamic var statuses = List<RequestStatus>()
    
    static override func primaryKey() -> String? {
        return "id"
    }
}
