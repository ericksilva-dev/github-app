//
//  ListRepositore.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 24/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import Foundation
class ListRepositore: ListRepositorieProtocol {

    let network: NetworkProtocol
    
    init(network: NetworkProtocol = Network()) {
        self.network = network
    }
    
    func requestAllUsers(idLast: Int, completion: @escaping AllUsersCallBack) {
        network.request(AppServiceUsers.requestAllUsers(idUser: idLast)) { result in
            switch result {
            case .success(let data):
                guard let object = try? JSONDecoder().decode([AllUsers].self, from: data) else {
                    completion(.failure(ErrorApi(error: .noData)))
                    return
                }
                completion(.success(object))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
