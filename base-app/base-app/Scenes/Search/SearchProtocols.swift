//
//  SearchProtocols.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 21/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import Foundation

protocol SearchPresenterType: class {
    var controller: SearchViewControllerType? { get set }
    func searchUser(username: String)
}

protocol SearchViewControllerType: class {
    func show()
}
