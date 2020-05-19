//
//  CellViewModel.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import UIKit

protocol CellViewModel {
    var identifier: String { get }
    var height: CGFloat { get }
    var didTap: VoidHandler? { get }
}

extension CellViewModel {
    var height: CGFloat {
        return UITableView.automaticDimension
    }
    
    var didTap: VoidHandler? {
        return nil
    }
}
