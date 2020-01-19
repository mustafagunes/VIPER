//
//  HomePresenter.swift
//  viper-exam
//
//  Created Mustafa GUNES on 19.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import UIKit

class HomePresenter: HomePresenterProtocol, HomeInteractorOutputProtocol {

    // MARK: - Definitions
    weak private var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    private let router: HomeWireframeProtocol

    // MARK: - Init Method
    init(interface: HomeViewProtocol, interactor: HomeInteractorInputProtocol?, router: HomeWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}
