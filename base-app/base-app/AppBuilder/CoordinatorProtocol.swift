//
//  CoordinatorProtocol.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 20/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

protocol CoordinatorProtocol: class {
    var currentCoordinator: CoordinatorProtocol? { get set }
    func start()
}
