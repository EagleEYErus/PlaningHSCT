//
//  TabBarController.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 17.05.2020.
//

import UIKit

final class TabBarController: UITabBarController {
    private let mainView = MainViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
}

extension TabBarController {
    private func configureTabBar() {
        tabBar.isTranslucent = true
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .lightGray
        configureControllers()
        configureTabBarItems()
    }
    
    private func configureControllers() {
        viewControllers = [NavigationController(rootViewController: mainView)]
    }
    
    private func configureTabBarItems() {
        guard let viewControllers = viewControllers else {
            return
        }
        viewControllers[0].tabBarItem = UITabBarItem(title: "Главная",
                                                     image: nil,
                                                     selectedImage: nil)
        for vc in viewControllers {
            let item = vc.tabBarItem
            item?.setTitleTextAttributes([.font: UIFont.primaryFont(ofSize: 12)], for: .normal)
            item?.setTitleTextAttributes([.font: UIFont.primaryFont(ofSize: 12, weight: .bold)], for: .selected)
        }
    }
}
