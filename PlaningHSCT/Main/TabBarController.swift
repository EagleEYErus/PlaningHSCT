//
//  TabBarController.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 17.05.2020.
//

import UIKit

final class TabBarController: UITabBarController {
    private let requestsView = RequestsViewController()
    private let stateView = StateViewController()
    private let calendarView = CalendarViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
}

extension TabBarController {
    private func configureTabBar() {
        tabBar.isTranslucent = false
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .lightGray
        configureControllers()
        configureTabBarItems()
    }
    
    private func configureControllers() {
        viewControllers = [
            NavigationController(rootViewController: requestsView),
            NavigationController(rootViewController: stateView),
            NavigationController(rootViewController: calendarView)
        ]
    }
    
    private func configureTabBarItems() {
        guard let viewControllers = viewControllers else {
            return
        }
        viewControllers[0].tabBarItem = UITabBarItem(title: "Заявки",
                                                     image: #imageLiteral(resourceName: "requests_tab_bar_item"),
                                                     selectedImage: nil)
        viewControllers[1].tabBarItem = UITabBarItem(title: "Состояние",
                                                     image: #imageLiteral(resourceName: "state_tab_bar_item"),
                                                     selectedImage: nil)
        viewControllers[2].tabBarItem = UITabBarItem(title: "Календарь",
                                                     image: #imageLiteral(resourceName: "calendar_tab_bar_item"),
                                                     selectedImage: nil)
        for vc in viewControllers {
            let item = vc.tabBarItem
            item?.setTitleTextAttributes([.font: UIFont.primaryFont(ofSize: 12)], for: .normal)
            item?.setTitleTextAttributes([.font: UIFont.primaryFont(ofSize: 12, weight: .bold)], for: .selected)
        }
    }
}
