//
//  AppCoordinator.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 20/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

final class AppCoordinator: CoordinatorProtocol {
    weak var currentCoordinator: CoordinatorProtocol?
    private let window: UIWindow?
    var navigationController: UINavigationController?
    
    init(windowScene: UIWindowScene?,
         navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        self.window?.windowScene = windowScene
    }
    
    func start() {
        guard let navigation = navigationController else { return }
        let coordinator = InitialCoordinator(navigationController: navigation)
        currentCoordinator = coordinator
        coordinator.start()
    }
}
