//
//  CommentProtocols.swift
//  viper-exam
//
//  Created Mustafa GUNES on 21.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import Foundation

// MARK: - Wireframe
protocol CommentWireframeProtocol: class {
}

// MARK: - Presenter
protocol CommentPresenterProtocol: class {
    var interactor: CommentInteractorInputProtocol? { get set }
    
    func getComments()
}

// MARK: - Interactor
protocol CommentInteractorOutputProtocol: class {
    func resultComments(comments: [Comment])
    func errorService(message: String)
}

protocol CommentInteractorInputProtocol: class {
    var presenter: CommentInteractorOutputProtocol?  { get set }
    
    func getComments()
}

// MARK: - View
protocol CommentViewProtocol: class {
    var presenter: CommentPresenterProtocol?  { get set }
    
    func setComments(comments: [Comment])
    func errorService(message: String)
}
