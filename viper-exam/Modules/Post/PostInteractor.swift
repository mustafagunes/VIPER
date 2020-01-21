//
//  PostInteractor.swift
//  viper-exam
//
//  Created Mustafa GUNES on 20.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import UIKit

class PostInteractor: PostInteractorInputProtocol {
    
    // MARK: - Definition
    weak var presenter: PostInteractorOutputProtocol?
    
    // MARK: - Method
    func getPosts() {
        let request = GetPostsRequest()
        request.fetchData(success: { (posts) in
            self.presenter?.resultPosts(posts: posts.array)
        }) { (error) in
            switch error {
            case .serviceError( _, let message):
                self.presenter?.errorService(message: message)
            default:
                break
            }
        }
    }
}
