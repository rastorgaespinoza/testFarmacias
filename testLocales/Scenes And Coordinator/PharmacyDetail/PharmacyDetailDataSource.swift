//
//  PharmacyDetailDataSource.swift
//  testLocales
//
//  Created by Rodrigo Astorga on 25-08-20.
//  Copyright © 2020 Rodrigo Astorga. All rights reserved.
//

import UIKit

final class PharmacyDetailDataSource: NSObject {
    private var organizer: DataOrganizer

    init(pharmacy: Pharmacy) {
        organizer = DataOrganizer(pharmacy: pharmacy)
    }

    func row(at index: Int) -> PharmacyDetailViewController.Row {
        return organizer.row(at: index)
    }
}

// MARK: UITableViewDataSource
extension PharmacyDetailDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return organizer.rowsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = organizer.row(at: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: row.cellTypeIdentifier, for: indexPath)
        if let configurableCell = cell as? RowConfigurable {
            configurableCell.configure(with: row)
        }
        return cell
    }
}

// MARK: - DataOrganizer
extension PharmacyDetailDataSource {
    struct DataOrganizer {
        private(set) var rows: [PharmacyDetailViewController.Row]
        
        var rowsCount: Int {
            return rows.count
        }

        init(pharmacy: Pharmacy) {
            let rows: [PharmacyDetailViewController.Row] = [
                .fecha(""),
                .localID(""),
                .localNombre(""),
                .comunaNombre(""),
                .localidadNombre(""),
                .localDireccion(""),
                .funcionamientoHoraApertura(""),
                .funcionamientoHoraCierre(""),
                .localTelefono(""),
                .localLat(""),
                .localLng(""),
                .funcionamientoDia(""),
                .fkRegion(""),
                .fkComuna(""),
                .fkLocalidad(""),
            ]
            self.rows = rows.map { pharmacy[$0] }
        }
        
        func row(at index: Int) -> PharmacyDetailViewController.Row {
            return rows[index]
        }
    }
}

// MARK: RowConfigurable
protocol RowConfigurable {
    func configure(with row: PharmacyDetailViewController.Row)
}

extension PharmacyDetailCell: RowConfigurable {
    func configure(with row: PharmacyDetailViewController.Row) {
        switch row {
        case let .fecha(text),
        let .localID(text),
        let .localNombre(text),
        let .comunaNombre(text),
        let .localidadNombre(text),
        let .localDireccion(text),
        let .funcionamientoHoraApertura(text),
        let .funcionamientoHoraCierre(text),
        let .localTelefono(text),
        let .localLat(text),
        let .localLng(text),
        let .funcionamientoDia(text),
        let .fkRegion(text),
        let .fkComuna(text),
        let .fkLocalidad(text):
            viewModel = ViewModel(title: row.titleCell, detail: text)
        }
    }
}
