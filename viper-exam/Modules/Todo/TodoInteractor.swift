//
//  TodoInteractor.swift
//  viper-exam
//
//  Created Mustafa GUNES on 22.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import UIKit

class TodoInteractor: TodoInteractorInputProtocol {
    
    // MARK: - Definition
    weak var presenter: TodoInteractorOutputProtocol?
    
    // MARK: - Method
    func getTodos() {
        let request = GetTodoRequest()
        request.fetchData(success: { (todos) in
            self.presenter?.resultTodos(todos: todos.array)
        }) { (error) in
            switch error {
            case .serviceError( _, let message):
                self.presenter?.errorService(message: message)
            default:
                break
            }
        }
    }
}
