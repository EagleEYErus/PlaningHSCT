//
//  DetailDonorPresenter.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 20.05.2020.
//

import Foundation

enum DetailType {
    case new
    case edit
}

protocol DetailDonorPresenter {
    var viewModels: [CellViewModel] { get }
    func saveDonor()
}

final class DetailDonorPresenterImpl: DetailDonorPresenter {
    private weak var view: DetailDonorViewController?
    private let donor: Donor
    private let type: DetailType
    private let didAddNewDonor: ((Donor) -> Void)?
    
    var viewModels = [CellViewModel]()
    
    init(view: DetailDonorViewController, donor: Donor?, didAddNewDonor: ((Donor) -> Void)?) {
        self.view = view
        self.type = donor == nil ? .new : .edit
        self.donor = donor ?? Donor()
        self.didAddNewDonor = didAddNewDonor
        configureViewModel()
    }
    
    func saveDonor() {
        guard
            let mainInfo = viewModels[0] as? DetailDonorMainInfoCellViewModel,
            let otherInfo = viewModels[1] as? DetailDonorOtherInfoCellViewModel else {
                return
        }
        
        let newDonor = Donor()
        newDonor.name = mainInfo.name
        newDonor.surname = mainInfo.surname
        newDonor.patronymic = mainInfo.patronymic
        newDonor.dateOfBirthday = mainInfo.dateOfBirthday
        newDonor.kinship = mainInfo.kinship
        newDonor.gender = mainInfo.gender.rawValue
        newDonor.height = mainInfo.heightValue
        newDonor.weight = mainInfo.weightValue
        newDonor.country = mainInfo.name
        newDonor.statusCMV = otherInfo.statusCMV
        newDonor.bloodType = otherInfo.bloodType
        newDonor.numberPregnancies = otherInfo.numberPregnancies
        newDonor.donorType = otherInfo.donorType
        newDonor.transplantType = otherInfo.transplantType
        newDonor.isOK = otherInfo.isOK
        newDonor.solution = otherInfo.solution
        newDonor.dateMaterials = otherInfo.dateMaterials
        newDonor.idMIS = otherInfo.idMIS
        newDonor.idLIS = otherInfo.idLIS
        newDonor.idInternational = otherInfo.idInternational
        
        didAddNewDonor?(newDonor)
        view?.dismiss()
    }
}

extension DetailDonorPresenterImpl {
    private func configureViewModel() {
        viewModels = [
            DetailDonorMainInfoCellViewModel(donor: donor),
            DetailDonorOtherInfoCellViewModel(donor: donor)
        ]
    }
}
