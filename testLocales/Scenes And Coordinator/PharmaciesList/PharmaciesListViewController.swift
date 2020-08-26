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
    @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
    
    weak var mainCoordinator: MainFlowCoordinator?
    private var presenter: PharmaciesListPresenter!
    private var dataSource = PharmaciesListDataSource(pharmacies: [])
    private var searchController: UISearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Listado de farmacias"
        presenter = PharmaciesListPresenter(pharmaciesListView: self)
        setupSearchBar()
        setupTableView()
        activityIndicatorView.startAnimating()
        presenter.getPharmacies()
    }
}

// MARK: - Config UI
extension PharmaciesListViewController{
    private func setupSearchBar() {
        searchController = UISearchController(searchResultsController: nil)
        searchController?.searchBar.scopeButtonTitles = ["todas", "por límite", "por nombre"]
        navigationItem.searchController = searchController
        searchController?.searchBar.delegate = self
        searchController?.searchBar.searchTextField.addDoneCancelToolbar(onDone: (target: self, action: #selector(doneButtonTappedForMyNumericTextField)))
    }
    
    private func setupTableView() {
        let nib = UINib(nibName: PharmacyTableViewCell.reuseIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: PharmacyTableViewCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = dataSource
    }
}

// MARK: - PharmaciesListView
extension PharmaciesListViewController: PharmaciesListView {
    func onGetPharmaciesList(pharmacies: Pharmacies) {
        activityIndicatorView.stopAnimating()
        dataSource.update(with: pharmacies)
        tableView.reloadData()
    }
    
    func onErrorGetPharmaciesList() {
        activityIndicatorView.stopAnimating()
        print("todo error")
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

// MARK: - UISearchBarDelegate
extension PharmaciesListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        switch selectedScope {
        case 1:
            searchBar.text?.removeAll(where: { (character: Character) -> Bool in
                !character.isNumber
            })
            searchBar.keyboardType = .numberPad
        default:
            searchBar.keyboardType = .default
        }
        searchBar.reloadInputViews()
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        guard searchBar.selectedScopeButtonIndex == 1 else {
            return true
        }
        return text.last?.isNumber ?? false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBySelectedScope()
    }

    @objc private func doneButtonTappedForMyNumericTextField() {
        searchController?.dismiss(animated: true, completion: nil)
        searchBySelectedScope()
    }
    
    private func searchBySelectedScope(){
        activityIndicatorView.startAnimating()
        switch searchController?.searchBar.selectedScopeButtonIndex {
        case 0:
            searchController?.searchBar.text = ""
            presenter.getPharmacies()
        case 1:
            presenter.getPharmaciesByLimit(limit: searchController?.searchBar.text ?? "")
        default:
            presenter.getPharmaciesByQuery(query: searchController?.searchBar.text ?? "")
        }
        searchController?.searchBar.resignFirstResponder()
    }
}
