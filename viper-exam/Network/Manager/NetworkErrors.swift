//
//  NetworkErrors.swift
//  viper-exam
//
//  Created by Mustafa GUNES on 19.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

// MARK: - ClientError
class ClientError: Codable {
    
    var code: String!
    var message: String!
    
    init(code: String, message: String) {
        self.code = code
        self.message = message
    }
}

// MARK: - ResponseError
enum ResponseError: Error {
    /// Timeout request
    case timeout
    /// Unknown error
    case unknown
    /// Data not returned
    case notDataReturned
    /// Model decoding failure
    case decodingFailure
    /// Status code 500
    case serverUnavailable
    /// Service error message
    case serviceError(code: Int? = nil, message: String)
}
