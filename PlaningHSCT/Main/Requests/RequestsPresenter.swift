//
//  RequestsPresenter.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import Foundation

protocol RequestsPresenter {
    var requests: [Request] { get }
    func loadRequests()
}

final class RequestsPresenterImpl: RequestsPresenter {
    private weak var view: RequestsViewController?
    
    var requests = [Request]()
    
    init(view: RequestsViewController) {
        self.view = view
        loadRequests()
    }
    
    func loadRequests() {
        requests = RealmServiceImpl.shared.get(Request.self)
    }
}
