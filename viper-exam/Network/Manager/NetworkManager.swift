//
//  NetworkManager.swift
//  viper-exam
//
//  Created by Mustafa GUNES on 17.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import Alamofire
import Foundation

final class NetworkManager {
    
    // MARK: - typealias
    typealias ObjectClosure<T: Codable> = ((T) -> Void)
    typealias ArrayClosure<T: Codable> = (([T]) -> Void)
    typealias ErrorClosure = ((ResponseError) -> Void)
    
    // MARK: - Create Header
    private static func createHeader() -> [String: String]? {
        var parameters: [String: String] = [:]
        parameters["Accept"] = "application/json"
        /*if let auth = Auth.saved() {
            parameters["Authorization"] = "Bearer \(auth.token!)"
            parameters["Accept-Language"] = Locale.current.languageCode
        }*/
        return parameters
    }
    
    // MARK: - Handle Failure
    private static func handleFailure(response: DataResponse<Data>, failure: @escaping ErrorClosure) {
        if let statusCode = response.response?.statusCode, statusCode == 401 {
            /*Auth.delete()
            NotificationCenter.PostNotification(.didUnauthorized)
            AppDelegate.shared.gotoMain()*/
            return
        }
        if let data = response.data, let serviceError = ClientError.decode(data) {
            if let json = String(data: data, encoding: .utf8) {
                Logger.log(output:"Response JSON: \(json)")
            }
            handleError(statusCode: response.response?.statusCode, localError: nil, serviceError: serviceError, failure: failure)
        } else if let error = response.result.error {
            handleError(statusCode: nil, localError: error, serviceError: nil, failure: failure)
        } else {
            handleError(statusCode: nil, localError: nil, serviceError: nil, failure: failure)
        }
    }
    
    // MARK: - Handle Error
    private static func handleError(statusCode: Int?, localError: Error?, serviceError: ClientError?, failure: @escaping ErrorClosure) {
        if let error = serviceError {
            failure(.serviceError(message: error.message))
        } else if let error = localError as? URLError, error.code == .notConnectedToInternet {
            failure(.serviceError(message: error.localizedDescription))
        } else if let error = localError {
            failure(.serviceError(message: error.localizedDescription))
        } else {
            failure(.serviceError(message: "Unknow Error"))
        }
    }
    
    // MARK: - Create Request
    private static func createRequest(_ request: RequestDelegate) -> DataRequest {
        Logger.log(output: "\n\nRequest Path: \(request.path)")
        Logger.log(output: "Request Method: \(request.method.rawValue)")
        Logger.log(output: "Request Parameters:")
        Logger.log(output: request.parameters ?? "nil")
        
        let request  = Alamofire.request(NetworkConfig.baseURL + request.path.rawValue, method: request.method, parameters: request.parameters, encoding: URLEncoding.default, headers: createHeader())
        request.validate()
        request.responseData { (response) in
            if let value = response.result.value {
                if let json = String(data: value, encoding: .utf8) {
                    Logger.log(output: "Response JSON: \(json)")
                }
            }
        }
        return request
    }
    
    // MARK: - Object Request
    static func request<T: Codable>(_ request: RequestDelegate, success: @escaping ObjectClosure<T>, failure: @escaping ErrorClosure) {
        let request = createRequest(request)
        request.responseData { (response) in
            switch response.result {
            case .success:
                guard let json = response.result.value else {
                    failure(.notDataReturned)
                    return
                }
                guard let parsed = T.decode(json) else {
                    failure(.decodingFailure)
                    return
                }
                success(parsed)
                break
            case .failure(let error):
                if (error as NSError).code == NSURLErrorTimedOut {
                    failure(.timeout)
                } else {
                    guard let _ = response.data else {
                        failure(.unknown)
                        return
                    }
                    handleFailure(response: response, failure: failure)
                }
            }
        }
    }
    
    // MARK: - Array Request
    static func request<T: Codable>(_ request: RequestDelegate, success: @escaping ArrayClosure<T>, failure: @escaping ErrorClosure) {
        let request = createRequest(request)
        request.responseData { (response) in
            switch response.result {
            case .success:
                guard let json = response.result.value else {
                    failure(.notDataReturned)
                    return
                }
                guard let parsed = T.decode(json) else {
                    failure(.decodingFailure)
                    return
                }
                success([parsed])
                break
            case .failure(let error):
                if (error as NSError).code == NSURLErrorTimedOut {
                    failure(.timeout)
                } else {
                    guard let _ = response.data else {
                        failure(.unknown)
                        return
                    }
                    handleFailure(response: response, failure: failure)
                }
            }
        }
    }
}
