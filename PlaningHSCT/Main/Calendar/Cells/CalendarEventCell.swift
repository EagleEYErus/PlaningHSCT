//
//  CalendarEventCell.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 24.05.2020.
//

import UIKit

final class CalendarEventCell: BaseTableViewCell {
    static let identifier = String(describing: CalendarEventCell.self)
    
    private let nameLabel = UILabel()
    private let typeTherapyLabel = UILabel()
    private let arrowImageView = UIImageView()
    
    weak var request: Request? {
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
        guard let request = request, let patient = request.patient else {
            return
        }
        nameLabel.text = patient.name + " " + patient.surname
        typeTherapyLabel.text = "Вид: " + (TherapyType(rawValue: request.therapyType)?.name ?? "")
    }
}

extension CalendarEventCell {
    private func configureView() {
        addArrowImageView()
        addNameLabel()
        addTypeTherapy()
        addSeparator()
    }
    
    private func addNameLabel() {
        nameLabel.font = .primaryFont(ofSize: 16, weight: .regular)
        nameLabel.textColor = .black
        nameLabel.numberOfLines = 0
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints {
            $0.right.equalTo(arrowImageView.snp.left).offset(-8)
            $0.left.top.equalToSuperview().inset(16)
        }
    }
    
    private func addTypeTherapy() {
        typeTherapyLabel.font = .primaryFont(ofSize: 16, weight: .regular)
        typeTherapyLabel.textColor = .grayRaven
        typeTherapyLabel.numberOfLines = 0
        typeTherapyLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(typeTherapyLabel)
        
        typeTherapyLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(8)
            $0.left.bottom.equalToSuperview().inset(16)
            $0.right.equalTo(arrowImageView.snp.left).offset(-8)
        }
    }
    
    private func addArrowImageView() {
        arrowImageView.image = #imageLiteral(resourceName: "right_arrow")
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(arrowImageView)
        
        arrowImageView.snp.makeConstraints {
            $0.right.equalToSuperview().inset(8)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(20)
        }
    }
    
    private func addSeparator() {
        let separator = UIView()
        separator.backgroundColor = .linkWater
        separator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(separator)
        
        separator.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}
