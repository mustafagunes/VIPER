//
//  GetPhotoRequest.swift
//  viper-exam
//
//  Created by Mustafa GUNES on 21.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import Alamofire

struct GetPhotoRequest: RequestArrayDelegate {
    
    typealias ResultObjectType = Photo
    
    var method: HTTPMethod = .get
    var path: NetworkConfig.RequestPath = .photos
    var parameters: Parameters?
}
