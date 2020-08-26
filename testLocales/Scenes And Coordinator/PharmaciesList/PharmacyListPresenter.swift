//
//  PharmaciesListPresenter.swift
//  testLocales
//
//  Created by Rodrigo Astorga on 24-08-20.
//  Copyright © 2020 Rodrigo Astorga. All rights reserved.
//

import Foundation
import Alamofire

final class PharmaciesListPresenter {
    private var pharmaciesListView: PharmaciesListView!
    
    init(pharmaciesListView: PharmaciesListView) {
        self.pharmaciesListView = pharmaciesListView
    }
    
    func getPharmacies() {
        AF.request(PharmaciesEndpoint.getPharmacies)
            .validate(statusCode: 200..<300)
            .responseDecodable { (response: DataResponse<Pharmacies, AFError>) in
                debugPrint(response)
                switch response.result {
                case .success(let pharmacies):
                    self.pharmaciesListView.onGetPharmaciesList(pharmacies: pharmacies)
                    print("success")
                case .failure(let error):
                     print("fail \(error)")
                    break
                }
            }
    }
    
    func getPharmaciesByQuery(query: String) {
        AF.request(PharmaciesGobEndpoint.getPharmaciesByPharmacy(pharmacy: query))
            .validate(statusCode: 200..<300)
            .responseDecodable { (response: DataResponse<PharmaciesGob, AFError>) in
                debugPrint(response)
                switch response.result {
                case .success(let responsePharmaciesGob):
                    let pharmacies = responsePharmaciesGob.result.records
                    self.pharmaciesListView.onGetPharmaciesList(pharmacies: pharmacies)
                    break
                case .failure(let error):
                    print("fail \(error)")
                    break
                }
        }
    }
    
    func getPharmaciesByLimit(limit: Int) {
        AF.request(PharmaciesGobEndpoint.getPharmaciesByLimit(limit: limit))
            .validate(statusCode: 200..<300)
            .responseDecodable { (response: DataResponse<PharmaciesGob, AFError>) in
                debugPrint(response)
                switch response.result {
                case .success(let responsePharmaciesGob):
                    let pharmacies = responsePharmaciesGob.result.records
                    self.pharmaciesListView.onGetPharmaciesList(pharmacies: pharmacies)
                    break
                case .failure(let error):
                    print("fail \(error)")
                    break
                }
        }
    }
}
