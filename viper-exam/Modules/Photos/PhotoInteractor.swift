//
//  PhotoInteractor.swift
//  viper-exam
//
//  Created Mustafa GUNES on 21.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import UIKit

class PhotoInteractor: PhotoInteractorInputProtocol {
    
    // MARK: - Definition
    weak var presenter: PhotoInteractorOutputProtocol?
    
    // MARK: - Method
    func getPhotos() {
        let request = GetPhotoRequest()
        request.fetchData(success: { [weak self] photos in
            guard let self = self else { return }
            self.presenter?.resultPhotos(photos: photos.array)
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
