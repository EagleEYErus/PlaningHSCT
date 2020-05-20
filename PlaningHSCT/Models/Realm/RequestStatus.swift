//
//  RequestStatus.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import Foundation
import RealmSwift

final class RequestStatus: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var status: Int = RequestStatusType.null.rawValue
    @objc dynamic var date: Date?
    
    static override func primaryKey() -> String? {
        return "id"
    }
}
