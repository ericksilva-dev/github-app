//
//  DetailUserPresenter.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 10/04/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import Foundation

class DetailUserPresenter: DetailUserPresenterType {
    
    weak var controller: DetailUserViewControllerDelegate?
    
    let repositore: DetailUserRepositoreType
    
    init(repositore: DetailUserRepositoreType = DetailUserRepositore()) {
        self.repositore = repositore
    }
    
    func searchForRepositores(_ username: String) {
        repositore.searchRepositoresUser(username: username) { [weak self] (result) in
            switch result {
            case .success(let repositores):
                self?.controller?.showDetailUser(repositores: repositores)
            case .failure(let error):
                print("OPS!!! OCORREU UM ERRO: \(error)")
            }
        }
    }
}
