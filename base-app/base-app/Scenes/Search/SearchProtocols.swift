//
//  SearchProtocols.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 21/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

typealias UserCallBack = (Result<User, ErrorApi>) -> Void

protocol SearchViewPresenterProtocol: class {
    var controller: SearchViewControllerProtocolType? { get set }
    func searchData(_ data: String?)
}

protocol SearchViewControllerProtocolType: class {
    func userDetail(_ user: User)
}

protocol SearchViewProtocol {
    
}

protocol SearchViewControllerDelegate: class {
    func wantsToUserDetail(_ user: User)
}

protocol SearchRepositoryProtocol {
    func requestUser(name: String, completion: @escaping UserCallBack)
}
