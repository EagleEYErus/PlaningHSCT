//
//  CalendarPresenter.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import Foundation

protocol CalendarPresenter {
    var requests: [Request] { get }
    func load(for date: Date)
}

final class CalendarPresenterImpl: CalendarPresenter {
    private weak var view: CalendarViewController?
    
    var requests = [Request]()
    
    init(view: CalendarViewController) {
        self.view = view
        self.addObserver()
        self.load(for: Date())
    }
    
    func load(for date: Date) {
        requests = RealmServiceImpl.shared.get(Request.self)
            .filter({ $0.datePlannedTherapy?.isEqualDay(date) ?? false })
    }
}

extension CalendarPresenterImpl {
    private func addObserver() {
        NotificationCenter.default.addObserver(forName: .updateRequest, object: nil, queue: nil) { [weak self] _ in
            guard let date = self?.view?.getSelectedDate() else {
                return
            }
            self?.load(for: date)
            self?.view?.reloadTableView()
        }
    }
}
