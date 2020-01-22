//
//  TodoPresenter.swift
//  viper-exam
//
//  Created Mustafa GUNES on 22.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import UIKit

class TodoPresenter: TodoPresenterProtocol {

    // MARK: - Definitions
    weak private var view: TodoViewProtocol?
    var interactor: TodoInteractorInputProtocol?
    private let router: TodoWireframeProtocol

    // MARK: - Init Method
    init(interface: TodoViewProtocol, interactor: TodoInteractorInputProtocol?, router: TodoWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func getTodos() {
        interactor?.getTodos()
    }
}

// MARK: - TodoInteractorOutputProtocol
extension TodoPresenter: TodoInteractorOutputProtocol {
    
    func resultTodos(todos: [Todo]) {
        view?.setTodos(todos: todos)
    }
    
    func errorService(message: String) {
        view?.errorService(message: message)
    }
}
