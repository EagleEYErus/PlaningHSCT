//
//  BaseViewController.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 17.05.2020.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupBackBarButtonItem()
    }
}
