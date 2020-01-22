//
//  UserProtocols.swift
//  viper-exam
//
//  Created Mustafa GUNES on 22.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import Foundation

// MARK: - Wireframe
protocol UserWireframeProtocol: class {
}

// MARK: - Presenter
protocol UserPresenterProtocol: class {
    var interactor: UserInteractorInputProtocol? { get set }
    
    func getUsers()
}

// MARK: - Interactor
protocol UserInteractorOutputProtocol: class {
    func resultUsers(users: [User])
    func errorService(message: String)
}

protocol UserInteractorInputProtocol: class {
    var presenter: UserInteractorOutputProtocol?  { get set }
    
    func getUsers()
}

// MARK: - View
protocol UserViewProtocol: class {
    var presenter: UserPresenterProtocol?  { get set }
    
    func setUsers(user: [User])
    func errorService(message: String)
}
