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
        NetworkServiceImpl.shared.get(RequestsNetworkModel.self, path: "/requests") { [weak self] model, error in
            guard let model = model, error == nil else {
                DispatchQueue.main.async { [weak self] in
                    self?.view?.showErrorAlert(message: error?.localizedDescription)
                    self?.loadRequestsFromDB()
                }
                return
            }
            let requests = RequestsMapper(networkModel: model).mapToModel()
            DispatchQueue.main.async { [weak self] in
                self?.saveRequests(requests)
                self?.loadRequestsFromDB()
            }
        }
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
            self?.loadRequestsFromDB()
        }
    }
    
    private func loadRequestsFromDB() {
        requests = RealmServiceImpl.shared.get(Request.self)
        view?.reloadTableView()
    }
    
    private func saveRequests(_ requests: [Request]) {
        RealmServiceImpl.shared.clear(Request.self)
        RealmServiceImpl.shared.clear(Donor.self)
        RealmServiceImpl.shared.clear(Patient.self)
        RealmServiceImpl.shared.clear(RequestStatus.self)
        
        for request in requests {
            RealmServiceImpl.shared.save(request)
        }
    }
}
