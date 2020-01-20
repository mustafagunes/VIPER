//
//  PostProtocols.swift
//  viper-exam
//
//  Created Mustafa GUNES on 20.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import Foundation

// MARK: - Wireframe
protocol PostWireframeProtocol: class {
}

// MARK: - Presenter
protocol PostPresenterProtocol: class {
    var interactor: PostInteractorInputProtocol? { get set }
    
    func getPosts()
}

// MARK: - Interactor
protocol PostInteractorOutputProtocol: class {
    func resultPosts(posts: [Post])
    func errorService(message: String)
}

protocol PostInteractorInputProtocol: class {
    var presenter: PostInteractorOutputProtocol?  { get set }
    
    func getPosts()
}

// MARK: - View
protocol PostViewProtocol: class {
    var presenter: PostPresenterProtocol?  { get set }
    
    func setPost(posts: [Post])
    func errorService(message: String)
}
