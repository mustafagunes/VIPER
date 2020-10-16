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
        request.fetchData(success: { [weak self] posts in
            guard let self = self else { return }
            self.presenter?.resultPosts(posts: posts.array)
        }) { [weak self] error in
            guard let self = self else { return }
            switch error {
            case .serviceError( _, let message):
                self.presenter?.errorService(message: message)
            default:
                break
            }
        }
    }
}
