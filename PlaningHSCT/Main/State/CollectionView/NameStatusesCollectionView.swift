//
//  NameStatusesCollectionView.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 03.06.2020.
//

import UIKit

final class NameStatusesCollectionView: UICollectionView {
    private let cells = RequestStatusType.allCases.filter({ $0 != .null })
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 100)
        super.init(frame: .zero, collectionViewLayout: layout)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NameStatusesCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: NameStatusCollectionViewCell.identifier,
                                 for: indexPath) as? NameStatusCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.set(status: cells[indexPath.row])
        return cell
    }
}

extension NameStatusesCollectionView {
    private func configureView() {
        backgroundColor = .clear
        delegate = self
        dataSource = self
        showsHorizontalScrollIndicator = false
        clipsToBounds = false
        register(NameStatusCollectionViewCell.self,
                 forCellWithReuseIdentifier: NameStatusCollectionViewCell.identifier)
    }
}
