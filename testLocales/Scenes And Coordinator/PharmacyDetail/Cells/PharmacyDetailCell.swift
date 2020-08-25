//
//  PharmacyDetailCell.swift
//  testLocales
//
//  Created by Rodrigo Astorga on 25-08-20.
//  Copyright © 2020 Rodrigo Astorga. All rights reserved.
//

import UIKit

final class PharmacyDetailCell: UITableViewCell {
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var detail: UILabel!
    
    static let reuseIdentifier = "PharmacyDetailCell"
    
    var viewModel = ViewModel() {
        didSet {
            title.text = viewModel.title
            detail.text = viewModel.detail
        }
    }
}

// MARK: - ViewModel
extension PharmacyDetailCell {
    struct ViewModel {
        var title = ""
        var detail = ""
    }
}
