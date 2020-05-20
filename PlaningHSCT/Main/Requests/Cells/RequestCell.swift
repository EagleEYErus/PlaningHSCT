//
//  RequestCell.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 20.05.2020.
//

import UIKit

final class RequestCell: BaseTableViewCell {
    static let identifier = String(describing: RequestCell.self)
    
    private let nameLabel = UILabel()
    private let statusLabel = UILabel()
    private let arrowImageView = UIImageView()
    
    var request: Request? {
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
        guard let request = request else {
            return
        }
        let patient = request.patient
        let status = request.statuses.sorted(by: { $0.date ?? Date() > $1.date ?? Date() }).first
        let titleStatus = RequestStatusType(rawValue: status?.status ?? RequestStatusType.null.rawValue)?.title
        let titleName = "\(patient?.name ?? "") \(patient?.surname ?? "")".trimmingCharacters(in: .whitespacesAndNewlines)
        nameLabel.text = titleName == "" ? "Нет имени пациента" : titleName
        statusLabel.text = titleStatus ?? "Нет статуса заявки"
    }
}

extension RequestCell {
    private func configureView() {
        addArrowImageView()
        addNameLabel()
        addStatusLabel()
        addSeparator()
    }
    
    private func addNameLabel() {
        nameLabel.font = .primaryFont(ofSize: 16, weight: .medium)
        nameLabel.textColor = .black
        nameLabel.numberOfLines = 0
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints {
            $0.top.left.equalToSuperview().inset(16)
            $0.right.equalTo(arrowImageView.snp.left).offset(-8)
        }
    }
    
    private func addStatusLabel() {
        statusLabel.font = .primaryFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .grayRaven
        statusLabel.numberOfLines = 0
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(statusLabel)
        
        statusLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(8)
            $0.left.equalToSuperview().inset(16)
            $0.right.equalTo(arrowImageView.snp.left).offset(-8)
            $0.bottom.equalToSuperview().inset(16)
        }
    }
    
    private func addArrowImageView() {
        arrowImageView.image = #imageLiteral(resourceName: "right_arrow")
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(arrowImageView)
        
        arrowImageView.snp.makeConstraints {
            $0.right.equalToSuperview().inset(8)
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(24)
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
