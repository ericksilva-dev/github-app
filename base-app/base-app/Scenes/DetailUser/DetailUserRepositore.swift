//
//  DetailUserRepositore.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 10/04/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import Foundation

class DetailUserRepositore: DetailUserRepositoreType {
    
    let network: NetworkProtocol
    
    init(network: NetworkProtocol = Network()) {
        self.network = network
    }
    
    func searchRepositoresUser(username: String,
                               completion: @escaping (Result<[RepositoresUser], ErrorApi>) -> Void) {
        network.request(AppServiceUsers.requestRepos(username: username)) { result in
            switch result {
            case .success(let data):
                guard let object = try? JSONDecoder().decode([RepositoresUser].self, from: data) else {
                    completion(.failure(ErrorApi(error: .noData)))
                    return
                }
                completion(.success(object))
            case .failure:
                completion(.failure(ErrorApi(error: nil)))
            }
        }
    }
}
