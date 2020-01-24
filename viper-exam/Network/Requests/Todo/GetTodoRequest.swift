//
//  GetTodoRequest.swift
//  viper-exam
//
//  Created by Mustafa GUNES on 22.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import NetworkManager

struct GetTodoRequest: RequestArrayDelegate {
    
    typealias ResultObjectType = Todo
    
    var method: HttpMethod = .get
    var path: String = RequestPath.todos.rawValue
    var parameters: Params?
}

