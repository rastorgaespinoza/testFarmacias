//
//  Pharmacy+PharmacyDetailViewController.swift
//  testLocales
//
//  Created by Rodrigo Astorga on 25-08-20.
//  Copyright © 2020 Rodrigo Astorga. All rights reserved.
//

import Foundation

extension Pharmacy {
    subscript(row: PharmacyDetailViewController.Row) -> PharmacyDetailViewController.Row {
        switch row {
        case .fecha: return .fecha(fecha)
        case .localID: return .localID(localID)
        case .localNombre: return .localNombre(localNombre)
        case .comunaNombre: return .comunaNombre(comunaNombre)
        case .localidadNombre: return .localidadNombre(localidadNombre)
        case .localDireccion: return .localDireccion(localDireccion)
        case .funcionamientoHoraApertura: return .funcionamientoHoraApertura(funcionamientoHoraApertura)
        case .funcionamientoHoraCierre: return .funcionamientoHoraCierre(funcionamientoHoraCierre)
        case .localTelefono: return .localTelefono(localTelefono)
        case .localLat: return .localLat(localLat)
        case .localLng: return .localLng(localLng)
        case .funcionamientoDia: return .funcionamientoDia(funcionamientoDia)
        case .fkRegion: return .fkRegion(fkRegion)
        case .fkComuna: return .fkComuna(fkComuna)
        case .fkLocalidad: return .fkLocalidad(fkLocalidad)
        }
    }
}
