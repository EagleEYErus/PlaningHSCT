//
//  DetailRequestPresenter.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import UIKit

protocol DetailRequestPresenter {
    func selectSegment(at index: Int)
}

final class DetailRequestPresenterImpl: DetailRequestPresenter {
    private weak var view: DetailRequestViewController?
    
    init(view: DetailRequestViewController) {
        self.view = view
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
    
    private lazy var requestView = SegmentRequestViewController()
    private lazy var statusView = SegmentStatusViewController()
    private lazy var patientView = SegmentPatientViewController()
    private lazy var donorView = SegmentDonorViewController()
    
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
}

extension DetailRequestPresenterImpl {
    
}
