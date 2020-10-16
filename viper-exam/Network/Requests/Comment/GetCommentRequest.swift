//
//  GetCommentRequest.swift
//  viper-exam
//
//  Created by Mustafa GUNES on 21.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import NetworkManager

struct GetCommentRequest: RequestArrayDelegate {
    
    typealias ResultObjectType = Comment
    
    var method: HttpMethod = .get
    var path: String = RequestPath.comments.rawValue
    var parameters: Params?
    var headers: [String : String] = [:]
}
