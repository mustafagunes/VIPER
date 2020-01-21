//
//  AlbumInteractor.swift
//  viper-exam
//
//  Created Mustafa GUNES on 21.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import UIKit

class AlbumInteractor: AlbumInteractorInputProtocol {
    
    // MARK: - Definition
    weak var presenter: AlbumInteractorOutputProtocol?
    
    // MARK: - Method
    func getAlbums() {
        let request = GetAlbumRequest()
        request.fetchData(success: { (albums) in
            self.presenter?.resultAlbums(albums: albums.array)
        }) { (error) in
            switch error {
            case .serviceError( _, let message):
                self.presenter?.serviceError(message: message)
            default:
                break
            }
        }
    }
}
