//
//  SegmentDonorPresenter.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import Foundation

protocol SegmentDonorPresenter {
    var donors: [Donor] { get }
    func addDonor(_ newDonor: Donor)
}

final class SegmentDonorPresenterImpl: SegmentDonorPresenter {
    private weak var view: SegmentDonorViewController?
    
    var donors = [Donor]()
    
    init(view: SegmentDonorViewController, donors: [Donor]) {
        self.view = view
        self.donors = donors
        configureViewModel()
    }
    
    func addDonor(_ newDonor: Donor) {
        donors.insert(newDonor, at: 0)
        view?.reloadTableView()
    }
}

extension SegmentDonorPresenterImpl {
    private func configureViewModel() {
        
    }
}
