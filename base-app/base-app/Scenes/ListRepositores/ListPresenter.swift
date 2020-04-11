//
//  ListPresenter.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 24/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import Foundation

class ListPresenter: ListPresenterProtocols {
    
    weak var controller: ListViewControllerType?
    
    var idLast = 0
    let repository: ListRepositorieProtocol
    
    init(repository: ListRepositorieProtocol = ListRepositore()) {
        self.repository = repository
    }
    
    func reloadData() {
        requestAllUsers()
    }
    
    func requestAllUsers() {
        repository.requestAllUsers(idLast: idLast) { result in
            switch result {
            case .success(let object):
                self.bindModel(object: object)
            case .failure:
                self.controller?.errorReloadView(error: "OPS!!! Ocorreu um erro")
            }
        }
    }
    
    func bindModel(object: [AllUsers]) {
        self.controller?.realodView(users: object)
    }
}
