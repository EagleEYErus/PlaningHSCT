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
    func deleteRequest(at index: Int)
}

final class RequestsPresenterImpl: RequestsPresenter {
    private weak var view: RequestsViewController?
    
    var requests = [Request]()
    
    init(view: RequestsViewController) {
        self.view = view
        addObserver()
        loadRequests()
    }
    
    func loadRequests() {
        requests = RealmServiceImpl.shared.get(Request.self)
    }
    
    func deleteRequest(at index: Int) {
        let request = requests[index]
        requests.remove(at: index)
        RealmServiceImpl.shared.delete(request)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            NotificationCenter.default.post(name: .updateRequest, object: nil)
        }
    }
}

extension RequestsPresenterImpl {
    private func addObserver() {
        NotificationCenter.default.addObserver(forName: .updateRequest, object: nil, queue: nil) { [weak self] _ in
            self?.loadRequests()
            self?.view?.reloadTableView()
        }
    }
}
