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
    static func decode(_ data: Data) -> Self? {
        let decoder = JSONDecoder()
        return try? decoder.decode(self, from: data)
    }
}
