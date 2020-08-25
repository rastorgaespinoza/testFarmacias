//
//  MainFlowCoordinator.swift
//  testLocales
//
//  Created by Rodrigo Astorga on 24-08-20.
//  Copyright © 2020 Rodrigo Astorga. All rights reserved.
//

import UIKit

// MARK: Protocols
protocol Coordinator: AnyObject {
    func configure(viewController: UIViewController)
    var navigationController: UINavigationController { get }
}

protocol MainCoordinated: AnyObject {
    var mainCoordinator: MainFlowCoordinator? { get set }
}

// MARK: - MainFlowCoordinator
class MainFlowCoordinator: NSObject {

    // MARK: - Properties

    let navigationController: UINavigationController

    // MARK: - Private properties

    private let window: UIWindow

    // MARK: - Init

    init(window: UIWindow) {
        self.navigationController = UINavigationController()
        self.window = window
        super.init()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        let pharmaciesViewController = PharmaciesListViewController()
        navigationController.pushViewController(pharmaciesViewController, animated: true)
        configure(viewController: pharmaciesViewController)
    }
    
    func showDetailPharmacy(with pharmacy: Pharmacy) {
        let pharmacyDetailViewController = PharmacyDetailViewController()
//        configure(viewController: pharmacyDetailViewController)
        pharmacyDetailViewController.pharmacy = pharmacy
        navigationController.pushViewController(pharmacyDetailViewController, animated: true)
    }
}

// MARK: Coordinator
extension MainFlowCoordinator: Coordinator {
    func configure(viewController: UIViewController) {
        (viewController as? MainCoordinated)?.mainCoordinator = self
        
        if let tabBarController = viewController as? UITabBarController {
            tabBarController.viewControllers?.forEach(configure(viewController:))
        }
        if let navigationController = viewController as? UINavigationController,
            let rootViewController = navigationController.viewControllers.first {
            configure(viewController: rootViewController)
        }
    }
}
