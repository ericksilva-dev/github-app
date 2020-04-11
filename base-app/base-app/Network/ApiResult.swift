//
//  ApiResult.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 21/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import Foundation

public typealias AppResult = (Result<Data, ErrorApi>) -> Void

public struct ErrorApi: Error {
    public let error: AppError?
    
    public init(error: AppError?) {
        self.error = error
    }
}

public enum ApiMethod: String {
    case get = "GET"
    case post = "POST"
}

public enum AppError: Error {
    case noResponse
    case noConnection
    case noData
    case invalidUrl
}
