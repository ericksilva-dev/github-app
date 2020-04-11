//
//  NetworkServiceProtocol.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 21/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import Foundation

protocol NetworkServiceProtocol {
    var path: String { get }
    var apiMethod: ApiMethod { get }
    var headers: [String: String]? { get }
}
