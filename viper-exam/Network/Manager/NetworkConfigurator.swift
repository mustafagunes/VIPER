//
//  NetworkConfigurator.swift
//  viper-exam
//
//  Created by Mustafa GUNES on 17.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

// MARK: - Configurator
struct NetworkConfig {
    
    static let baseURL: String = "https://jsonplaceholder.typicode.com/"
    
    enum RequestPath: String {
        case posts
        case comments
        case albums
        case photos
        case todos
        case users
    }
}
