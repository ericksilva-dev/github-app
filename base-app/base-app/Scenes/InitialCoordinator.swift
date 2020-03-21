//
//  InitialCoordinator.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 20/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

class InitialCoordinator: CoordinatorProtocol {
    var currentCoordinator: CoordinatorProtocol?
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = createAppTabBarViewController()
        navigationController.pushViewController(controller, animated: true)
    }
}
// MARK: - AppTabBarViewController
extension InitialCoordinator {
    private func createAppTabBarViewController() -> AppTabBarViewController {
        let controller = AppTabBarViewController()
        return controller
    }
}
