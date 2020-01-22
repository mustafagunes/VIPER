//
//  HomeProtocols.swift
//  viper-exam
//
//  Created Mustafa GUNES on 19.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import Foundation

// MARK: - Wireframe
protocol HomeWireframeProtocol: class {
    func showPosts()
    func showComments()
    func showAlbums()
    func showPhotos()
    func showTodos()
    func showUsers()
}

// MARK: - Presenter
protocol HomePresenterProtocol: class {
    func showPosts()
    func showComments()
    func showAlbums()
    func showPhotos()
    func showTodos()
    func showUsers()
}

// MARK: - View
protocol HomeViewProtocol: class {
    var presenter: HomePresenterProtocol?  { get set }
}
