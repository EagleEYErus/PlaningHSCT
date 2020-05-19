//
//  UIViewController.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import UIKit

extension UIViewController {
    func presentFull(_ viewController: UIViewController, completion: VoidHandler? = nil) {
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true, completion: completion)
    }
    
    func presentRoot(_ viewController: UIViewController, completion: VoidHandler? = nil) {
        let navigation = NavigationController(rootViewController: viewController)
        presentFull(navigation, completion: completion)
    }
    
    func dismiss(completion: VoidHandler? = nil) {
        dismiss(animated: true, completion: completion)
    }
    
    func setupBackBarButtonItem() {
        navigationController?.navigationBar.backIndicatorImage = nil
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = nil
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .black
    }
    
    func setupCloseBarButtonItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "close"),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(didTapClose))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc
    private func didTapClose() {
        dismiss()
    }
}
