//
//  TodoProtocols.swift
//  viper-exam
//
//  Created Mustafa GUNES on 22.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import Foundation

// MARK: - Wireframe
protocol TodoWireframeProtocol: class {
}

// MARK: - Presenter
protocol TodoPresenterProtocol: class {
    var interactor: TodoInteractorInputProtocol? { get set }
    
    func getTodos()
}

// MARK: - Interactor
protocol TodoInteractorOutputProtocol: class {
    func resultTodos(todos: [Todo])
    func errorService(message: String)
}

protocol TodoInteractorInputProtocol: class {
    var presenter: TodoInteractorOutputProtocol?  { get set }
    
    func getTodos()
}

// MARK: - View
protocol TodoViewProtocol: class {
    var presenter: TodoPresenterProtocol?  { get set }
    
    func setTodos(todos: [Todo])
    func errorService(message: String)
}
