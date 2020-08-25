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
}
