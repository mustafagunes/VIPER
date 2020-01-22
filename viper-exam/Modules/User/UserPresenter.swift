//
//  UserPresenter.swift
//  viper-exam
//
//  Created Mustafa GUNES on 22.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import UIKit

class UserPresenter: UserPresenterProtocol {

    // MARK: - Definitions
    weak private var view: UserViewProtocol?
    var interactor: UserInteractorInputProtocol?
    private let router: UserWireframeProtocol

    // MARK: - Init Method
    init(interface: UserViewProtocol, interactor: UserInteractorInputProtocol?, router: UserWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func getUsers() {
        interactor?.getUsers()
    }
}

// MARK: - UserInteractorOutputProtocol
extension UserPresenter: UserInteractorOutputProtocol {
    
    func resultUsers(users: [User]) {
        view?.setUsers(user: users)
    }
    
    func errorService(message: String) {
        view?.errorService(message: message)
    }
}
