//
//  SearchRepository.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 21/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import Foundation

class SearchRepository: SearchRepositoryProtocol {
    
    let network: NetworkProtocol
    
    init(network: NetworkProtocol = Network()) {
        self.network = network
    }
    
    func requestUser(name: String, completion: @escaping UserCallBack) {
        network.request(AppServiceUsers.requestUser(name: name)) { (result) in
            switch result {
            case .success(let data):
                guard let object = try? JSONDecoder().decode(User.self, from: data) else {
                    return
                }
                completion(.success(object))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
