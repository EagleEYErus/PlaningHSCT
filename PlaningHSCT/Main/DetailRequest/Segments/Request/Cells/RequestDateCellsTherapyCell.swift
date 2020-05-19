//
//  RequestDateCellsTherapyCell.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import UIKit

final class RequestDateCellsTherapyCell: BaseTableViewCell {
    static let identifier = String(describing: RequestDateCellsTherapyCell.self)
    
    private let datePlaningTherapyView = TextFieldView()
    private let dateTherapyView = TextFieldView()
    private let dateHospitalizationView = TextFieldView()
    
    private weak var viewModel: RequestDateCellsTherapyViewModel? {
        didSet {
            updateView()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateView() {
        
    }
}

extension RequestDateCellsTherapyCell: BaseCell {
    func set(_ viewModel: CellViewModel) {
        self.viewModel = viewModel as? RequestDateCellsTherapyViewModel
    }
}

extension RequestDateCellsTherapyCell {
    private func configureView() {
        addDatePlaningTherapyView()
        addDateTherapyView()
        addDateHospitalizationView()
    }
    
    private func addDatePlaningTherapyView() {
        datePlaningTherapyView.label.text = "Планируемая дата клеточной терапии"
        datePlaningTherapyView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(datePlaningTherapyView)
        
        datePlaningTherapyView.snp.makeConstraints {
            $0.left.top.right.equalToSuperview().inset(16)
        }
    }
    
    private func addDateTherapyView() {
        dateTherapyView.label.text = "Дата клеточной терапии"
        dateTherapyView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dateTherapyView)
        
        dateTherapyView.snp.makeConstraints {
            $0.top.equalTo(datePlaningTherapyView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
        }
    }
    
    private func addDateHospitalizationView() {
        dateHospitalizationView.label.text = "Дата госпитализации"
        dateHospitalizationView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dateHospitalizationView)
        
        dateHospitalizationView.snp.makeConstraints {
            $0.top.equalTo(dateTherapyView.snp.bottom).offset(16)
            $0.left.right.bottom.equalToSuperview().inset(16)
        }
    }
}
