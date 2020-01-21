//
//  CommentPresenter.swift
//  viper-exam
//
//  Created Mustafa GUNES on 21.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import UIKit

class CommentPresenter: CommentPresenterProtocol {

    // MARK: - Definitions
    weak private var view: CommentViewProtocol?
    var interactor: CommentInteractorInputProtocol?
    private let router: CommentWireframeProtocol

    // MARK: - Init Method
    init(interface: CommentViewProtocol, interactor: CommentInteractorInputProtocol?, router: CommentWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func getComments() {
        interactor?.getComments()
    }
}

// MARK: - CommentInteractorOutputProtocol
extension CommentPresenter: CommentInteractorOutputProtocol {
    
    func resultComments(comments: [Comment]) {
        view?.setComments(comments: comments)
    }
    
    func errorService(message: String) {
        view?.errorService(message: message)
    }
}
