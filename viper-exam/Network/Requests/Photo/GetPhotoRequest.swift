//
//  GetPhotoRequest.swift
//  viper-exam
//
//  Created by Mustafa GUNES on 21.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import NetworkManager

struct GetPhotoRequest: RequestArrayDelegate {
    
    typealias ResultObjectType = Photo
    
    var method: HttpMethod = .get
    var path: String = RequestPath.photos.rawValue
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
