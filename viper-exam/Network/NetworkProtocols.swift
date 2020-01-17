//
//  NetworkProtocols.swift
//  viper-exam
//
//  Created by Mustafa GUNES on 17.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import Alamofire

/// Service HTTP Method
///
/// - get: GET Verb
/// - post: POST Verb
/// - head: HEAD Verb
/// - put: PUT Verb
/// - delete: DELETE Verb
enum ServiceHTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
    case head    = "HEAD"
    case put     = "PUT"
    case delete  = "DELETE"
}

// MARK: - Response Errors
enum ResponseError: Error {
    case unknown
    case decodingFailure
    case serviceError(message: String)
}

// MARK: - RequestDelegate
protocol RequestDelegate {
    var method: HTTPMethod { get }
    var path: NetworkConfig.RequestPath { get }
    var parameters: Parameters? { get set }
}

// MARK: - NetworkClient
protocol NetworkDelegate {
}
