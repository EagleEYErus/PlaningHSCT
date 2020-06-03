//
//  AuthorizationPresenter.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 03.06.2020.
//

import UIKit

protocol AuthorizationPresenter {
    func signIn(login: String, password: String)
}

final class AuthorizationPresenterImpl: AuthorizationPresenter {
    private weak var view: AuthorizationViewController?
    
    init(view: AuthorizationViewController) {
        self.view = view
    }
    
    func signIn(login: String, password: String) {
        let model = AuthorizationNetworkModel(username: login, password: password)
        NetworkServiceImpl.shared.get(model, path: "/user/sign_in") { [weak self] data, error in
            guard let _ = data, error == nil else {
                DispatchQueue.main.async { [weak self] in
                    self?.view?.showErrorAlert(message: error?.localizedDescription)
                }
                return
            }
            DispatchQueue.main.async {
                UIApplication.shared.keyWindow?.rootViewController = TabBarController()
            }
        }
    }
}
