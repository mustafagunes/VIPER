//
//  GetAlbumRequest.swift
//  viper-exam
//
//  Created by Mustafa GUNES on 21.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import Alamofire
import NetworkManager

struct GetAlbumRequest: RequestArrayDelegate {
    
    typealias ResultObjectType = Album
    
    var method: HttpMethod = .get
    var path: String = RequestPath.albums.rawValue
    var parameters: Params?
}
