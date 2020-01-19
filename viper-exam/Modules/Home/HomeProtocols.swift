//
//  HomeProtocols.swift
//  viper-exam
//
//  Created Mustafa GUNES on 19.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import Foundation

// MARK: - Wireframe
protocol HomeWireframeProtocol: class {
}

// MARK: - Presenter
protocol HomePresenterProtocol: class {
    var interactor: HomeInteractorInputProtocol? { get set }
}

// MARK: - Interactor
protocol HomeInteractorOutputProtocol: class {
    /* Interactor -> Presenter */
}

protocol HomeInteractorInputProtocol: class {
    var presenter: HomeInteractorOutputProtocol?  { get set }
    /* Presenter -> Interactor */
}

// MARK: - View
protocol HomeViewProtocol: class {
    var presenter: HomePresenterProtocol?  { get set }
    /* Presenter -> ViewController */
}
