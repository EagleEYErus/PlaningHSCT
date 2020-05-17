//
//  NavigationController.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 17.05.2020.
//

import UIKit

final class NavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

extension NavigationController {
    private func configureView() {
        view.backgroundColor = .white
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.backgroundColor = .white
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = false
        navigationBar.titleTextAttributes = [
            .font: UIFont.primaryFont(ofSize: 17, weight: .bold),
            .foregroundColor: UIColor.black
        ]
    }
}
