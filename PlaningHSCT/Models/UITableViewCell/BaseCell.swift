//
//  BaseCell.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import UIKit

protocol BaseCell: UITableViewCell {
    func set(_ viewModel: CellViewModel)
}
