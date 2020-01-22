//
//  GetUserRequest.swift
//  viper-exam
//
//  Created by Mustafa GUNES on 22.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import Alamofire

struct GetUserRequest: RequestArrayDelegate {
    
    typealias ResultObjectType = User
    
    var method: HTTPMethod = .get
    var path: NetworkConfig.RequestPath = .users
    var parameters: Parameters?
}
