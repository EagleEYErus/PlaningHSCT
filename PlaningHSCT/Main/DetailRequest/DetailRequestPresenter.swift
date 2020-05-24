//
//  DetailRequestPresenter.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import UIKit

protocol DetailRequestPresenter {
    func selectSegment(at index: Int)
    func saveRequest()
}

final class DetailRequestPresenterImpl: DetailRequestPresenter {
    private weak var view: DetailRequestViewController?
    private let request: Request
    private let type: DetailType
    
    init(view: DetailRequestViewController, request: Request? = nil) {
        self.view = view
        self.request = request ?? Request()
        self.type = request == nil ? .new : .edit
        self.selectedView = requestView
        self.view?.add(asChildViewController: selectedView)
    }
    
    private var selectedView: UIViewController! {
        didSet {
            view?.add(asChildViewController: selectedView)
        }
        willSet {
            view?.remove(asChildViewController: selectedView)
        }
    }
    
    private lazy var requestView: SegmentRequestViewController = {
        let view = SegmentRequestViewController()
        view.presenter = SegmentRequestPresenterImpl(view: view, request: request)
        return view
    }()
    
    private lazy var statusView: SegmentStatusViewController = {
        let view = SegmentStatusViewController()
        view.presenter = SegmentStatusPresenterImpl(view: view, statuses: request.statuses.compactMap({ $0 }))
        return view
    }()
    
    private lazy var patientView: SegmentPatientViewController = {
        let view = SegmentPatientViewController()
        view.presenter = SegmentPatientPresenterImpl(view: view, patient: request.patient)
        return view
    }()
    
    private lazy var donorView: SegmentDonorViewController = {
        let view = SegmentDonorViewController()
        view.presenter = SegmentDonorPresenterImpl(view: view, donors: request.donors.compactMap({ $0 }))
        return view
    }()
    
    func selectSegment(at index: Int) {
        switch index {
        case 0:
            selectedView = requestView
        case 1:
            selectedView = statusView
        case 2:
            selectedView = patientView
        case 3:
            selectedView = donorView
        default:
            return
        }
    }
    
    func saveRequest() {
        let statuses = statusView.getStatuses()
        let donors = donorView.getDonors()
        let patient = patientView.getPatient()
        let newRequest = requestView.getRequest()
        
        newRequest.patient = patient
        newRequest.addDonors(donors)
        newRequest.addStatuses(statuses)
        
        if type == .edit {
            RealmServiceImpl.shared.delete(request)
        }
        
        RealmServiceImpl.shared.save(newRequest)
        
        NotificationCenter.default.post(name: .updateRequest, object: nil)
        
        view?.dismiss()
    }
}
