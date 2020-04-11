//
//  ListProtocols.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 24/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

typealias AllUsersCallBack = (Result<[AllUsers], ErrorApi>) -> Void

protocol ListRepositorieProtocol: class {
    func requestAllUsers(idLast: Int, completion: @escaping AllUsersCallBack)
}

protocol ListPresenterProtocols: class {
    var controller: ListViewControllerType? { get set }
    func reloadData()
}

protocol ListViewControllerType: class {
    func errorReloadView(error: String)
    func realodView(users: [AllUsers])
}

protocol ListViewType {
    func show(users: [AllUsers])
}

protocol ListViewControllerDelegate: class {
    func wantsToContinueDetailUser(user: AllUsers)
}
