//
//  Donor.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import Foundation
import RealmSwift

final class Donor: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var surname: String = ""
    @objc dynamic var patronymic: String = ""
    @objc dynamic var dateOfBirthday: Date?
    @objc dynamic var kinship: String = ""
    @objc dynamic var gender: Int = Gender.null.rawValue
    @objc dynamic var height: Int = 0
    @objc dynamic var weight: Int = 0
    @objc dynamic var country: String = ""
    @objc dynamic var statusCMV: String = ""
    @objc dynamic var bloodType: String = ""
    @objc dynamic var numberPregnancies: Int = 0
    @objc dynamic var donorType: String = ""
    @objc dynamic var transplantType: String = ""
    @objc dynamic var isOK: Bool = false
    @objc dynamic var solution: String = ""
    @objc dynamic var dateMaterials: Date?
    
    @objc dynamic var idMIS: String = ""
    @objc dynamic var idLIS: String = ""
    @objc dynamic var idInternational: String = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
