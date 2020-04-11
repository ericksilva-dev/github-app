//
//  DetailUserProtocols.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 10/04/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import Foundation

protocol DetailUserHeaderType: class {
    func showHeaderModel(user: User)
}

protocol DetailUserViewType: class {
    func showModel(user: User, repositores: [RepositoresUser])
}

protocol DetailUserPresenterType: class {
    var controller: DetailUserViewControllerDelegate? { get set }
    func searchForRepositores(_ username: String)
}

protocol DetailUserViewControllerDelegate: class {
    func showDetailUser(repositores: [RepositoresUser])
}

protocol DetailUserRepositoreType: class {
    func searchRepositoresUser(username: String,
                               completion: @escaping (Result<[RepositoresUser], ErrorApi>) -> Void)
}
