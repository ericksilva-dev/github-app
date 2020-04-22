//
//  NetworkProtocol.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 21/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import Foundation

protocol NetworkProtocol {
    func request(_ service: NetworkServiceProtocol, completion: AppResult?)
}

public class Network: NetworkProtocol {
    
//    private let baseUrl = "https://api.github.com"
    private let baseUrl = "https://cheesecakelabs.com/"
    private let logApp: AppLogProtocol = AppLog()
    
    var sessionConfig: URLSessionConfiguration = {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 60.0
        sessionConfig.timeoutIntervalForResource = 80.0
        return sessionConfig
    }()
    
    private let successCode: Range<Int> = 200..<299
    
    lazy var pinnedUrlSession: URLSession = {
        return URLSession(configuration: sessionConfig)
    }()
    
    func request(_ service: NetworkServiceProtocol, completion: AppResult?) {
        guard let urlRequest = configureRequest(with: service, baseUrl: baseUrl) else {
            return
        }
        logApp.logApp(urlRequest: urlRequest)
        execute(request: urlRequest, urlSession: pinnedUrlSession, completion: completion)
    }
    
    func configureRequest(with service: NetworkServiceProtocol, baseUrl: String) -> URLRequest? {
        guard let url = URL(string: "\(baseUrl)/\(service.path)") else {
            logApp.logAppDebug(statusCode: nil, message: "ERROR: the placed url is not valid")
            return nil
        }
        
        let allHeaders = service.headers ?? [:]
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = service.apiMethod.rawValue
        
        for header in allHeaders {
            urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
        }
        
        return urlRequest
    }
    
    func execute(request: URLRequest, urlSession: URLSession, completion: AppResult?) {
        let dataTask = urlSession.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard let response = response as? HTTPURLResponse else {
                    self.logApp.logAppDebug(statusCode: nil, message: "ERROR: no Response")
                    completion?(.failure(ErrorApi(error: .noResponse)))
                    return
                }
                guard self.successCode.contains(response.statusCode) else {
                    self.logApp.logAppDebug(statusCode: response.statusCode, message: "ERROR: failed to connect to the service")
                    completion?(.failure(ErrorApi(error: .noConnection)))
                    return
                }
                
                guard let data = data else {
                    self.logApp.logAppDebug(statusCode: nil, message: "ERROR: failed to get a date")
                    completion?(.failure(ErrorApi(error: .noData)))
                    return
                }
                print("Response: \(String(describing: data))")
                completion?(.success(data))
            }
        }
        dataTask.resume()
    }
}
