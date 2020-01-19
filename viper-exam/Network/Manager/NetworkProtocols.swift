//
//  NetworkProtocols.swift
//  viper-exam
//
//  Created by Mustafa GUNES on 17.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import Alamofire
import Foundation

// MARK: - RequestDelegate
protocol RequestDelegate {
    var method: HTTPMethod { get }
    var path: NetworkConfig.RequestPath { get }
    var parameters: Parameters? { get set }
}

// MARK: - RequestObjectDelegate
protocol RequestObjectDelegate: RequestDelegate {
    associatedtype ResultObjectType: Codable
}

extension RequestObjectDelegate {
    func fetchData(success: @escaping NetworkManager.ObjectClosure<ResultObjectType>, failure: @escaping NetworkManager.ErrorClosure) {
        NetworkManager.request(self, success: success, failure: failure)
    }
}

// MARK: - RequestArrayDelegate
protocol RequestArrayDelegate: RequestDelegate {
    associatedtype ResultObjectType: Codable
}

extension RequestArrayDelegate {
    func fetchData(success: @escaping NetworkManager.ArrayClosure<ResultObjectType>, failure: @escaping NetworkManager.ErrorClosure) {
        NetworkManager.request(self, success: success, failure: failure)
    }
}
