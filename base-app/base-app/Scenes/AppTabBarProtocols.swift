//
//  AppTabBarProtocols.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 29/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import Foundation

protocol AppTabBarViewControllerDelegate: class {
//    func wantsToDetailUser(user: AllUsers)
    func wantsToDetailUser(user: User)
}

protocol  AppTabBarViewControllerType: class {
    var delegateTabBar: AppTabBarViewControllerDelegate? { get set }
}
