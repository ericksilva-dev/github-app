//
//  Teste.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 17/04/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import Foundation

struct AllMessages: Codable {
    let title: String?
    let website: String?
    let authors: String?
    let date: String?
    let content: String?
    let tags: [Tags]?
    let image_url: String?
}

struct Tags: Codable {
    let id: String?
    let label: String?
}
