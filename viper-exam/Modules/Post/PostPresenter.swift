//
//  PostPresenter.swift
//  viper-exam
//
//  Created Mustafa GUNES on 20.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import UIKit

class PostPresenter: PostPresenterProtocol {

    // MARK: - Definitions
    weak private var view: PostViewProtocol?
    var interactor: PostInteractorInputProtocol?
    private let router: PostWireframeProtocol

    // MARK: - Init Method
    init(interface: PostViewProtocol, interactor: PostInteractorInputProtocol?, router: PostWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - PostInteractorOutputProtocol
extension PostPresenter: PostInteractorOutputProtocol {
    
    func getPosts() {
        interactor?.getPosts()
    }
    
    func resultPosts(posts: [Post]) {
        view?.setPost(posts: posts)
    }
    
    func errorService(message: String) {
        view?.errorService(message: message)
    }
}
