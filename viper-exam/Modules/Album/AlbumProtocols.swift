//
//  AlbumProtocols.swift
//  viper-exam
//
//  Created Mustafa GUNES on 21.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import Foundation

// MARK: - Wireframe
protocol AlbumWireframeProtocol: class {
}

// MARK: - Presenter
protocol AlbumPresenterProtocol: class {
    var interactor: AlbumInteractorInputProtocol? { get set }
    
    func getAlbums()
}

// MARK: - Interactor
protocol AlbumInteractorOutputProtocol: class {
    func resultAlbums(albums: [Album])
    func serviceError(message: String)
}

protocol AlbumInteractorInputProtocol: class {
    var presenter: AlbumInteractorOutputProtocol?  { get set }
    
    func getAlbums()
}

// MARK: - View
protocol AlbumViewProtocol: class {
    var presenter: AlbumPresenterProtocol?  { get set }
    
    func setAlbums(albums: [Album])
    func errorService(message: String)
}
