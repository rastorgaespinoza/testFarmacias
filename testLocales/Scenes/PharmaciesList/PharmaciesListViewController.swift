//
//  PharmaciesListViewController.swift
//  testLocales
//
//  Created by Rodrigo Astorga on 24-08-20.
//  Copyright © 2020 Rodrigo Astorga. All rights reserved.
//

import UIKit

class PharmaciesListViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    var presenter: PharmaciesListPresenter!
    var dataSource = PharmaciesListDataSource(pharmacies: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = PharmaciesListPresenter(pharmaciesListView: self)
        let nib = UINib(nibName: PharmacyTableViewCell.reuseIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: PharmacyTableViewCell.reuseIdentifier)
        tableView.dataSource = dataSource
        presenter.getPharmacies()
    }
}

extension PharmaciesListViewController: PharmaciesListView {
    func onGetPharmaciesList(pharmacies: Pharmacies) {
        dataSource.update(with: pharmacies)
        tableView.reloadData()
    }
}
