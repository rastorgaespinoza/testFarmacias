//
//  Pharmacy.swift
//  testLocales
//
//  Created by Rodrigo Astorga on 24-08-20.
//  Copyright © 2020 Rodrigo Astorga. All rights reserved.
//

import Foundation

// MARK: - DrugStore
struct Pharmacy: Codable {
    let fecha, localID, localNombre, comunaNombre: String
    let localidadNombre, localDireccion, funcionamientoHoraApertura, funcionamientoHoraCierre: String
    let localTelefono, localLat, localLng, funcionamientoDia: String
    let fkRegion, fkComuna, fkLocalidad: String

    enum CodingKeys: String, CodingKey {
        case fecha
        case localID = "local_id"
        case localNombre = "local_nombre"
        case comunaNombre = "comuna_nombre"
        case localidadNombre = "localidad_nombre"
        case localDireccion = "local_direccion"
        case funcionamientoHoraApertura = "funcionamiento_hora_apertura"
        case funcionamientoHoraCierre = "funcionamiento_hora_cierre"
        case localTelefono = "local_telefono"
        case localLat = "local_lat"
        case localLng = "local_lng"
        case funcionamientoDia = "funcionamiento_dia"
        case fkRegion = "fk_region"
        case fkComuna = "fk_comuna"
        case fkLocalidad = "fk_localidad"
    }
}

typealias Pharmacies = [Pharmacy]
