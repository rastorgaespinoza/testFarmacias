//
//  PharmaciesListDataSource.swift
//  testLocales
//
//  Created by Rodrigo Astorga on 24-08-20.
//  Copyright © 2020 Rodrigo Astorga. All rights reserved.
//

import UIKit

class PharmaciesListDataSource: NSObject {
    private var pharmacies = Pharmacies()
    
    init(pharmacies: Pharmacies) {
        self.pharmacies = pharmacies
        super.init()
    }

    func pharmacy(at indexPath:IndexPath)-> Pharmacy {
        return pharmacies[indexPath.row]
    }
    
    func update(with pharmacies: Pharmacies) {
        self.pharmacies = pharmacies
    }
}

extension PharmaciesListDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pharmacies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: PharmacyTableViewCell.reuseIdentifier,
            for: indexPath) as! PharmacyTableViewCell
        return cell
    }
    
    
}

