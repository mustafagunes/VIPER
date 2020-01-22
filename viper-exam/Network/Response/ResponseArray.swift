//
//  ResponseArray.swift
//  viper-exam
//
//  Created by Mustafa GUNES on 21.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

class ResponseArray<T: Codable>: Codable {
    
    var array: [T]
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.array = try! container.decode([T].self)
    }
}
