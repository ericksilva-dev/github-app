//
//  SearchPresenter.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 21/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

class SearchPresenter: SearchViewPresenterProtocol {
    
    var controller: SearchViewControllerProtocolType?
    let repository: SearchRepositoryProtocol
    
    init(repository: SearchRepositoryProtocol = SearchRepository()) {
        self.repository = repository
    }
    
    func searchData(_ data: String?) {
        guard let dataString = data, !dataString.isEmpty else {
            print("Error no  data")
            return
        }
        requestUser(data: dataString)
    }
    
    func requestUser(data: String) {
        repository.requestUser(name: data) { (result) in
            switch result {
            case .success(let user):
                self.controller?.userDetail(user)
            case .failure(let error):
                print("ERROR: \(error)")
            }
        }
    }
}
