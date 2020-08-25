//
//  PharmacyTableViewCell.swift
//  testLocales
//
//  Created by Rodrigo Astorga on 24-08-20.
//  Copyright © 2020 Rodrigo Astorga. All rights reserved.
//

import UIKit

final class PharmacyTableViewCell: UITableViewCell {
    @IBOutlet private weak var pharmacyName: UILabel!
    @IBOutlet private weak var pharmacyAddress: UILabel!
    @IBOutlet private weak var locationName: UILabel!
    
    
    static let reuseIdentifier = "PharmacyTableViewCell"
    
    var viewModel = ViewModel() {
        didSet {
            pharmacyName.text = viewModel.pharmacyName
            pharmacyAddress.text = viewModel.pharmacyAddress
            locationName.text = viewModel.locationName
        }
    }
}

extension PharmacyTableViewCell {
    struct ViewModel {
        var pharmacyName: String = ""
        var pharmacyAddress: String = ""
        var locationName: String = ""
    }
}
