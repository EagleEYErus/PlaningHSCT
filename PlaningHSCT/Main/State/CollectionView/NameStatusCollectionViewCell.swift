//
//  NameStatusCollectionViewCell.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 03.06.2020.
//

import UIKit

final class NameStatusCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: NameStatusCollectionViewCell.self)
    
    private let colorView = UIView()
    private let nameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(status: RequestStatusType) {
        colorView.backgroundColor = status.color
        nameLabel.text = status.title
    }
}

extension NameStatusCollectionViewCell {
    private func configureView() {
        backgroundColor = .white
        addColorView()
        addNameLabel()
    }
    
    private func addColorView() {
        colorView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(colorView)
        
        colorView.snp.makeConstraints {
            $0.left.top.right.equalToSuperview()
            $0.height.equalTo(10)
        }
    }
    
    private func addNameLabel() {
        nameLabel.font = .primaryFont(ofSize: 13)
        nameLabel.numberOfLines = 0
        nameLabel.textAlignment = .center
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(colorView.snp.bottom)
            $0.left.bottom.right.equalToSuperview()
        }
    }
}
