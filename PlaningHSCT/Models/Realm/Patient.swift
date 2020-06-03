//
//  Patient.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import Foundation
import RealmSwift

final class Patient: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var serverId: Int = -1
    @objc dynamic var name: String = ""
    @objc dynamic var surname: String = ""
    @objc dynamic var patronymic: String = ""
    @objc dynamic var dateOfBirthday: Date?
    @objc dynamic var gender: Int = Gender.null.rawValue
    @objc dynamic var idMIS: String = ""
    @objc dynamic var idLIS: String = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
