//
//  Date.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 20.05.2020.
//

import Foundation

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "RU")
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: self)
    }
    
    func isEqualDay(_ date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.startOfDay(for: self) == calendar.startOfDay(for: date)
    }
}
