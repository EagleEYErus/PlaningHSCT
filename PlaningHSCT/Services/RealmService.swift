//
//  RealmService.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 17.05.2020.
//

import Foundation
import RealmSwift

protocol RealmService {
    func get<T: Object>(_ type: T.Type) -> [T]
    func save(_ object: Object)
    func edit(_ handler: VoidHandler?)
    func delete(_ object: Object)
    func clear<T: Object>(_ type: T.Type)
}

final class RealmServiceImpl: RealmService {
    static let shared: RealmService = RealmServiceImpl()
    
    private let realm = try? Realm()
    
    private init() {
        print("Realm URL: \(String(describing: realm?.configuration.fileURL))")
    }
    
    func get<T: Object>(_ type: T.Type) -> [T] {
        return realm?.objects(type).compactMap({ $0 }) ?? []
    }
    
    func save(_ object: Object) {
        try? realm?.write {
            realm?.add(object)
        }
    }
    
    func edit(_ handler: VoidHandler?) {
        try? realm?.write {
            handler?()
        }
    }
    
    func delete(_ object: Object) {
        try? realm?.write {
            realm?.delete(object)
        }
    }
    
    func clear<T: Object>(_ type: T.Type) {
        try? realm?.write {
            guard let objects = realm?.objects(type) else {
                return
            }
            realm?.delete(objects)
        }
    }
}
