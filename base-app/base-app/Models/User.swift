//
//  User.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 21/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import Foundation

struct User: Codable {
    let login: String
    let name: String
    let location: String?
    let avatar_url: String
    let repos_url: String?
    let bio: String?
    let public_repos: Int
    let followers: Int
    let following: Int
    let created_at: String
    let updated_at: String
}
