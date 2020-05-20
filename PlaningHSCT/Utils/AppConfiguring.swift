//
//  AppConfiguring.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 20.05.2020.
//

import UIKit
import IQKeyboardManagerSwift

protocol AppConfiguring {
    func configure()
}

final class AppConfiguringImpl: AppConfiguring {
    func configure() {
        setupIQKeyboardManager()
    }
}

extension AppConfiguringImpl {
    private func setupIQKeyboardManager() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Готово"
        IQKeyboardManager.shared.toolbarBarTintColor = .white
        IQKeyboardManager.shared.toolbarTintColor = .systemBlue
        IQKeyboardManager.shared.previousNextDisplayMode = .alwaysHide
    }
}
