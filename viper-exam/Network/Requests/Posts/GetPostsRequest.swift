//
//  GetPostsRequest.swift
//  viper-exam
//
//  Created by Mustafa GUNES on 20.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import NetworkManager

struct GetPostsRequest: RequestArrayDelegate {
    
    typealias ResultObjectType = Post
    
    var method: HttpMethod = .get
    var path: String = RequestPath.posts.rawValue
    var parameters: Params?
    
    init() {
        printFileAndFunction()
    }
    
    func printFileAndFunction() {
        print("----------------------------------------------------")
        print(#file.components(separatedBy: "/").last! + " - " + #function)
        print("----------------------------------------------------")
    }
}
