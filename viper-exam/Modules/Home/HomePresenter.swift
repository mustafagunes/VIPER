//
//  HomePresenter.swift
//  viper-exam
//
//  Created Mustafa GUNES on 19.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import UIKit

class HomePresenter {

    // MARK: - Definitions
    weak private var view: HomeViewProtocol?
    private let router: HomeWireframeProtocol

    // MARK: - Init Method
    init(interface: HomeViewProtocol, router: HomeWireframeProtocol) {
        self.view = interface
        self.router = router
    }
}

extension HomePresenter: HomePresenterProtocol {
    
    func showPosts() {
        router.showPosts()
    }
    
    func showComments() {
        router.showComments()
    }
    
    func showAlbums() {
        router.showAlbums()
    }
    
    func showPhotos() {
        router.showPhotos()
    }
    
    func showTodos() {
        router.showTodos()
    }
}
