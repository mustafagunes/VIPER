//
//  CommentInteractor.swift
//  viper-exam
//
//  Created Mustafa GUNES on 21.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import UIKit

class CommentInteractor: CommentInteractorInputProtocol {
    
    // MARK: - Definition
    weak var presenter: CommentInteractorOutputProtocol?
    
    // MARK: - Method
    func getComments() {
        let request = GetCommentRequest()
        request.fetchData(success: { [weak self] comments in
            guard let self = self else { return }
            self.presenter?.resultComments(comments: comments.array)
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
