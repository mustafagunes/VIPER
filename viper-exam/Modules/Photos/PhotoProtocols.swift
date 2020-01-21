//
//  PhotoProtocols.swift
//  viper-exam
//
//  Created Mustafa GUNES on 21.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import Foundation

// MARK: - Wireframe
protocol PhotoWireframeProtocol: class {
}

// MARK: - Presenter
protocol PhotoPresenterProtocol: class {
    var interactor: PhotoInteractorInputProtocol? { get set }
    
    func getPhotos()
}

// MARK: - Interactor
protocol PhotoInteractorOutputProtocol: class {
    func resultPhotos(photos: [Photo])
    func errorService(message: String)
}

protocol PhotoInteractorInputProtocol: class {
    var presenter: PhotoInteractorOutputProtocol?  { get set }
    
    func getPhotos()
}

// MARK: - View
protocol PhotoViewProtocol: class {
    var presenter: PhotoPresenterProtocol?  { get set }
    
    func setPhotos(photos: [Photo])
    func errorService(message: String)
}
