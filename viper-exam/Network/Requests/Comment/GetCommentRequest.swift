//
//  GetCommentRequest.swift
//  viper-exam
//
//  Created by Mustafa GUNES on 21.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import Alamofire

struct GetCommentRequest: RequestArrayDelegate {
    
    typealias ResultObjectType = Comment
    
    var method: HTTPMethod = .get
    var path: NetworkConfig.RequestPath = .comments
    var parameters: Parameters?
}
