//
//  Encode+DecodeExtensions.swift
//  viper-exam
//
//  Created by Mustafa GUNES on 19.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import Foundation

extension Encodable {
    func encode() -> Data? {
        let encoder = JSONEncoder()
        encoder.dataEncodingStrategy = .deferredToData
        return try? encoder.encode(self)
    }
}

extension Decodable {
    
    /// Parsing the model in Decodable type
    /// - Parameters:
    ///   - data: Data.
    ///   - decoder: JSONDecoder. Initialized by default
    init?(from data: Data, using decoder: JSONDecoder = .init()) {
        guard let parsed = try? decoder.decode(Self.self, from: data) else { return nil }
        self = parsed
    }
}
