//
//  PhotoPresenter.swift
//  viper-exam
//
//  Created Mustafa GUNES on 21.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import UIKit

class PhotoPresenter: PhotoPresenterProtocol {

    // MARK: - Definitions
    weak private var view: PhotoViewProtocol?
    var interactor: PhotoInteractorInputProtocol?
    private let router: PhotoWireframeProtocol

    // MARK: - Init Method
    init(interface: PhotoViewProtocol, interactor: PhotoInteractorInputProtocol?, router: PhotoWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func getPhotos() {
        interactor?.getPhotos()
    }
}

// MARK: - PhotoInteractorOutputProtocol
extension PhotoPresenter: PhotoInteractorOutputProtocol {
    
    func resultPhotos(photos: [Photo]) {
        view?.setPhotos(photos: photos)
    }
    
    func errorService(message: String) {
        view?.errorService(message: message)
    }
}
