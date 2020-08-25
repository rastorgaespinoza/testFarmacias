//
//  PharmaciesListViewController.swift
//  testLocales
//
//  Created by Rodrigo Astorga on 24-08-20.
//  Copyright © 2020 Rodrigo Astorga. All rights reserved.
//

import UIKit

final class PharmaciesListViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    var mainCoordinator: MainFlowCoordinator?
    private var presenter: PharmaciesListPresenter!
    private var dataSource = PharmaciesListDataSource(pharmacies: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Listado de farmacias"
        presenter = PharmaciesListPresenter(pharmaciesListView: self)
        let nib = UINib(nibName: PharmacyTableViewCell.reuseIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: PharmacyTableViewCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = dataSource
        presenter.getPharmacies()
    }
}

// MARK: - PharmaciesListView
extension PharmaciesListViewController: PharmaciesListView {
    func onGetPharmaciesList(pharmacies: Pharmacies) {
        dataSource.update(with: pharmacies)
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate
extension PharmaciesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showDetail(dataSource.pharmacy(at: indexPath))
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - MainCoordinated & Segue
extension PharmaciesListViewController: MainCoordinated {
    private func showDetail(_ pharmacy: Pharmacy) {
        mainCoordinator?.showDetailPharmacy(with: pharmacy)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        mainCoordinator?.configure(viewController: segue.destination)
    }
}
