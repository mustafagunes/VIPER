//
//  NetworkConfigurator.swift
//  viper-exam
//
//  Created by Mustafa GUNES on 17.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import NetworkManager

enum RequestPath: String {
    case posts
    case comments
    case albums
    case photos
    case todos
    case users
}

extension RequestArrayDelegate {

    public var baseUrl: String {
        return "https://jsonplaceholder.typicode.com/"
    }
    
    // MARK: - Whether or not status the session is open
    public var headers: [String: String] {
        var header: [String: String] = [:]
        header["Accept"] = "application/json"
        header["Authorization"] = "Bearer test"
        return header
    }
}
