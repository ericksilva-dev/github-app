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
    
    func createDetailUserViewController(_ user: User) -> DetailUserViewController {
        let presenter = DetailUserPresenter()
        let controller = DetailUserViewController(presenter: presenter, user: user)
        return controller
    }
}
// MARK: - AppTabBarViewController
extension InitialCoordinator {
    private func createAppTabBarViewController() -> AppTabBarViewController {
        let controller = AppTabBarViewController()
        controller.delegateTabBar = self
        return controller
    }
}

// MARK: - AppTabBarViewControllerDelegate
extension InitialCoordinator: AppTabBarViewControllerDelegate {
    func wantsToDetailUser(user: User) {
        let controller = createDetailUserViewController(user)
        navigationController.pushViewController(controller, animated: true)
    }
}
