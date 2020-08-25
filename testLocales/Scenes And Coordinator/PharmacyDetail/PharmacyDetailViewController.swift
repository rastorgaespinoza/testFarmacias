//
//  PharmacyDetailViewController.swift
//  testLocales
//
//  Created by Rodrigo Astorga on 24-08-20.
//  Copyright © 2020 Rodrigo Astorga. All rights reserved.
//

import UIKit

final class PharmacyDetailViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private var dataSource: PharmacyDetailDataSource?
    var pharmacy: Pharmacy?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let pharmacy = pharmacy else {
            return
        }
        let nib = UINib(nibName: PharmacyDetailCell.reuseIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: PharmacyDetailCell.reuseIdentifier)
        dataSource = PharmacyDetailDataSource(pharmacy: pharmacy)
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
}

// MARK: - Row
extension PharmacyDetailViewController {
    enum Row {
        case fecha(String)
        case localID(String)
        case localNombre(String)
        case comunaNombre(String)
        case localidadNombre(String)
        case localDireccion(String)
        case funcionamientoHoraApertura(String)
        case funcionamientoHoraCierre(String)
        case localTelefono(String)
        case localLat(String)
        case localLng(String)
        case funcionamientoDia(String)
        case fkRegion(String)
        case fkComuna(String)
        case fkLocalidad(String)
        
        var cellTypeIdentifier: String {
            return PharmacyDetailCell.reuseIdentifier
        }
        
        var titleCell: String {
            switch self {
            case .fecha: return "Fecha"
            case .localID: return "Local Id"
            case .localNombre: return "Local Nombre"
            case .comunaNombre: return "Comuna nombre"
            case .localidadNombre: return "Localidad Nombre"
            case .localDireccion: return "Local Dirección"
            case .funcionamientoHoraApertura: return "Funcionamiento Hora Apertura"
            case .funcionamientoHoraCierre: return "Funcionamiento Hora Cierre"
            case .localTelefono: return "Local Teléfono"
            case .localLat: return "Local Latitud"
            case .localLng: return "Local Longitud"
            case .funcionamientoDia: return "Funcionamiento Día"
            case .fkRegion: return "Fk Región"
            case .fkComuna: return "Fk Comuna"
            case .fkLocalidad: return "Fk Localidad"
            }
        }
    }
}
