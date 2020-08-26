//
//  PharmacyGobResult.swift
//  testLocales
//
//  Created by Rodrigo Astorga on 25-08-20.
//  Copyright © 2020 Rodrigo Astorga. All rights reserved.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let drugStoresGob = try? newJSONDecoder().decode(PharmaciesGob.self, from: jsonData)

// MARK: - DrugStoresGob
struct PharmaciesGob: Codable {
    let help: String
    let success: Bool
    let result: Result
}

// MARK: - Result
struct Result: Codable {
    let resourceID: String
    let fields: [Field]
    let records: Pharmacies
    let links: Links
    let limit: Int?
    let q: String?
    let total: Int

    enum CodingKeys: String, CodingKey {
        case resourceID = "resource_id"
        case fields, records
        case links = "_links"
        case limit, total
        case q
    }
}

// MARK: - Field
struct Field: Codable {
    let type: String
    let id: String
}

// MARK: - Links
struct Links: Codable {
    let start, next: String
}
