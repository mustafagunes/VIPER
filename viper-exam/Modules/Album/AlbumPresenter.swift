//
//  AlbumPresenter.swift
//  viper-exam
//
//  Created Mustafa GUNES on 21.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import UIKit

class AlbumPresenter: AlbumPresenterProtocol {

    // MARK: - Definitions
    weak private var view: AlbumViewProtocol?
    var interactor: AlbumInteractorInputProtocol?
    private let router: AlbumWireframeProtocol

    // MARK: - Init Method
    init(interface: AlbumViewProtocol, interactor: AlbumInteractorInputProtocol?, router: AlbumWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func getAlbums() {
        interactor?.getAlbums()
    }
}

// MARK: - AlbumInteractorOutputProtocol
extension AlbumPresenter: AlbumInteractorOutputProtocol {
    
    func resultAlbums(albums: [Album]) {
        view?.setAlbums(albums: albums)
    }
    
    func serviceError(message: String) {
        view?.errorService(message: message)
    }
}
