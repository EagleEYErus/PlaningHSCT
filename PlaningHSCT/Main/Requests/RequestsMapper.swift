//
//  RequestsMapper.swift
//  PlaningHSCT
//
//  Created by Момотов Евгений Олегович on 03.06.2020.
//

import Foundation

final class RequestsMapper {
    let networkModel: RequestsNetworkModel
    
    init(networkModel: RequestsNetworkModel) {
        self.networkModel = networkModel
    }
    
    func mapToModel() -> [Request] {
        let requests = networkModel.records?.requests ?? []
        
        var result = [Request]()
        for request in requests {
            let newRequest = Request()
            newRequest.serverId = request.id
            newRequest.therapyType = request.hsct_type_id ?? TherapyType.null.rawValue
            newRequest.therapyNumber = request.hsct_number ?? NumberTherapyType.null.rawValue
            newRequest.branchHSCT = request.department_id ?? BranchHSCT.null.rawValue
            newRequest.detailTherapyType = request.disease_status ?? ""
            newRequest.dateTherapy = getDate(from: request.hsct_date)
            newRequest.datePlannedTherapy = getDate(from: request.intended_hsct_date)
            newRequest.dateHospitalization = getDate(from: request.hospitalization_date)
            newRequest.TBI = request.tbi_check ?? false
            newRequest.TAI = request.tai_check ?? false
            newRequest.patient = getPatient(with: request.patient_id) ?? Patient()
            
            let donors = getDonors(with: request.id)
            for donor in donors {
                newRequest.donors.append(donor)
            }
            result.append(newRequest)
        }
        return result
    }
}

extension RequestsMapper {
    private func getDate(from stringDate: String?) -> Date? {
        guard let stringDate = stringDate else {
            return nil
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: stringDate)
    }
    
    private func getPatient(with id: Int?) -> Patient? {
        guard let patient = networkModel.records?.patients.first(where: { $0.id == id }) else {
            return nil
        }
        let newPatient = Patient()
        newPatient.serverId = patient.id
        newPatient.name = patient.given_name ?? ""
        newPatient.surname = patient.family_name ?? ""
        newPatient.patronymic = patient.patronymic ?? ""
        newPatient.dateOfBirthday = getDate(from: patient.birth_date)
        newPatient.gender = Gender(networkKey: patient.sex).rawValue
        newPatient.idMIS = patient.mis_id ?? ""
        newPatient.idLIS = patient.lis_id ?? ""
        return newPatient
    }
    
    private func getDonors(with requestId: Int) -> [Donor] {
        guard let donorships = networkModel.records?.donorships.filter({ $0.request_id == requestId }) else {
            return []
        }
        var result = [Donor]()
        for donorship in donorships {
            guard let donor = networkModel.records?.donors.first(where: { $0.id == donorship.donor_id }) else {
                continue
            }
            let newDonor = Donor()
            newDonor.serverId = donor.id
            newDonor.name = donor.given_name ?? ""
            newDonor.surname = donor.family_name ?? ""
            newDonor.patronymic = donor.patronymic ?? ""
            newDonor.dateOfBirthday = getDate(from: donor.birth_date)
            newDonor.kinship = ""
            newDonor.gender = Gender(networkKey: donor.sex).rawValue
            newDonor.height = Int(donorship.height ?? 0.0)
            newDonor.weight = Int(donorship.weight ?? 0.0)
            newDonor.country = donorship.country ?? ""
            newDonor.statusCMV = donor.anti_cmv_igg_id?.toString() ?? ""
            newDonor.bloodType = donorship.blood_type_id?.toString() ?? ""
            newDonor.numberPregnancies = donorship.pregnancies_count ?? 0
            newDonor.donorType = donorship.type_id?.toString() ?? ""
            newDonor.transplantType = donorship.transplant_type_id?.toString() ?? ""
            newDonor.isOK = donorship.approved ?? false
            newDonor.solution = ""
            newDonor.dateMaterials = getDate(from: donorship.material_draw_date)
            newDonor.idMIS = donor.mis_id ?? ""
            newDonor.idLIS = donor.lis_id ?? ""
            newDonor.idInternational = donor.international_id ?? ""
            result.append(newDonor)
        }
        return result
    }
}
