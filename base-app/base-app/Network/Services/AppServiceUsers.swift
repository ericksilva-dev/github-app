//
//  AppServiceUsers.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 21/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import Foundation

enum AppServiceUsers: NetworkServiceProtocol {
    case requestUser(name: String)
    case requestAllUsers(idUser: Int)
    case requestRepos(username: String)
    case teste
    
    var path: String {
        switch self {
        case .requestUser(let name):
            return "users/\(name)"
        case .requestAllUsers(let idUser):
            return "users?since=\(idUser)"
        case .requestRepos(let username):
            return "users/\(username)/repos"
        case .teste:
            return "challenge/"
        }
    }
    var apiMethod: ApiMethod {
        return .get
    }
    var headers: [String : String]? {
        switch self {
        case .teste:
            return ["Content-type": "application/json"]
        case .requestUser, .requestRepos, .requestAllUsers:
            return nil
        }
    }
}
