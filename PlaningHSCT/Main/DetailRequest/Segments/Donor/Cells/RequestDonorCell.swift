//
//  RequestDonorCell.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import UIKit

final class RequestDonorCell: BaseTableViewCell {
    static let identifier = String(describing: RequestDonorCell.self)
    
    private let nameLabel = UILabel()
    private let surnameLabel = UILabel()
    private let arrowImageView = UIImageView()
    
    var donor: Donor? {
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
        guard let donor = donor else {
            return
        }
        nameLabel.text = donor.name
        surnameLabel.text = donor.surname
    }
}

extension RequestDonorCell {
    private func configureView() {
        addArrowImageView()
        addNameLabel()
        addSurnameLabel()
        addSeparator()
    }
    
    private func addNameLabel() {
        nameLabel.font = .primaryFont(ofSize: 16, weight: .regular)
        nameLabel.textColor = .black
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints {
            $0.left.top.equalToSuperview().inset(16)
            $0.right.equalTo(arrowImageView.snp.left).offset(-8)
        }
    }
    
    private func addSurnameLabel() {
        surnameLabel.font = .primaryFont(ofSize: 16, weight: .regular)
        surnameLabel.textColor = .black
        surnameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(surnameLabel)
        
        surnameLabel.snp.makeConstraints {
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
