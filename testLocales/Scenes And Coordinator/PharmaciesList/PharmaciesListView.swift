//
//  PharmaciesListView.swift
//  testLocales
//
//  Created by Rodrigo Astorga on 24-08-20.
//  Copyright © 2020 Rodrigo Astorga. All rights reserved.
//

import Foundation

protocol PharmaciesListView {
    func onGetPharmaciesList(pharmacies: Pharmacies)
    func onErrorGetPharmaciesList()
}
