//
//  GetUserRequest.swift
//  viper-exam
//
//  Created by Mustafa GUNES on 22.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import NetworkManager

struct GetUserRequest: RequestArrayDelegate {
    
    typealias ResultObjectType = User
    
    var method: HttpMethod = .get
    var path: String = RequestPath.users.rawValue
    var parameters: Params?
    var headers: [String : String] = [:]
}
