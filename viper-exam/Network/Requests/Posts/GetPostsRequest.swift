//
//  GetPostsRequest.swift
//  viper-exam
//
//  Created by Mustafa GUNES on 20.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import Alamofire

struct GetPostsRequest: RequestArrayDelegate {
    
    typealias ResultObjectType = Post
    
    var method: HTTPMethod = .get
    var path: NetworkConfig.RequestPath = .posts
    var parameters: Parameters?
}
