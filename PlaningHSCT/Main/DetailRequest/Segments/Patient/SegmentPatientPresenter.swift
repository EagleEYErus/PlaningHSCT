//
//  SegmentPatientPresenter.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 19.05.2020.
//

import Foundation

protocol SegmentPatientPresenter {
    var viewModels: [RequestPatientViewModel] { get }
    func getPatient() -> Patient
}

final class SegmentPatientPresenterImpl: SegmentPatientPresenter {
    private weak var view: SegmentPatientViewController?
    private let patient: Patient
    private let type: DetailType
    
    var viewModels = [RequestPatientViewModel]()
    
    init(view: SegmentPatientViewController, patient: Patient?) {
        self.view = view
        self.patient = patient ?? Patient()
        self.type = patient == nil ? .new : .edit
        configureViewModel()
    }
    
    func getPatient() -> Patient {
        let viewModel = viewModels[0]
        
        let newPatient = Patient()
        newPatient.name = viewModel.name
        newPatient.surname = viewModel.surname
        newPatient.patronymic = viewModel.patronymic
        newPatient.dateOfBirthday = viewModel.dateOfBirthday
        newPatient.gender = viewModel.gender.rawValue
        newPatient.idMIS = viewModel.idMIS
        newPatient.idLIS = viewModel.idLIS
        return newPatient
    }
}

extension SegmentPatientPresenterImpl {
    private func configureViewModel() {
        viewModels = [
            RequestPatientViewModel(patient: patient)
        ]
    }
}
