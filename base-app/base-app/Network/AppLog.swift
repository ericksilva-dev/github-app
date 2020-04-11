//
//  AppLog.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 21/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import Foundation

protocol AppLogProtocol {
    func logApp(urlRequest: URLRequest)
    func logAppDebug(statusCode: Int?, message: String?)
}

class AppLog: AppLogProtocol {
    
    func logApp(urlRequest: URLRequest) {
        print("Headers: \(urlRequest.allHTTPHeaderFields) \n" +
              "URL: \(urlRequest.url) \n" +
              "Body: \(urlRequest.httpBody)")
    }
    
    func logAppDebug(statusCode: Int?, message: String?) {
        print("DEBUB APP 😎: \(message) \n StatusCode: \(statusCode)")
    }
}
