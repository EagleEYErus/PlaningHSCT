//
//  SegmentRequestPresenter.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import Foundation

protocol SegmentRequestPresenter {
    var viewModels: [CellViewModel] { get }
    func getRequest() -> Request
}

final class SegmentRequestPresenterImpl: SegmentRequestPresenter {
    private weak var view: SegmentRequestViewController?
    private let request: Request
    
    var viewModels = [CellViewModel]()
    
    init(view: SegmentRequestViewController, request: Request) {
        self.view = view
        self.request = request
        configureViewModel()
    }
    
    func getRequest() -> Request {
        guard
            let therapyCell = viewModels[0] as? RequestCellsTherapyViewModel,
            let dateCell = viewModels[1] as? RequestDateCellsTherapyViewModel else {
            return Request()
        }
        let newRequest = Request()
        newRequest.therapyType = therapyCell.therapyType
        newRequest.therapyNumber = therapyCell.therapyNumber
        newRequest.branchHSCT = therapyCell.branchHSCT
        newRequest.detailTherapyType = therapyCell.detailTherapyType
        newRequest.datePlannedTherapy = dateCell.datePlannedTherapy
        newRequest.dateTherapy = dateCell.dateTherapy
        newRequest.dateHospitalization = dateCell.dateHospitalization
        newRequest.TBI = dateCell.TBI
        newRequest.TAI = dateCell.TAI
        return newRequest
    }
}

extension SegmentRequestPresenterImpl {
    private func configureViewModel() {
        viewModels = [
            RequestCellsTherapyViewModel(request: request),
            RequestDateCellsTherapyViewModel(request: request)
        ]
    }
}
