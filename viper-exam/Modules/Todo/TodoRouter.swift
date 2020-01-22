//
//  TodoRouter.swift
//  viper-exam
//
//  Created Mustafa GUNES on 22.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import UIKit

class TodoRouter: TodoWireframeProtocol {

    // MARK: - Definitions
    weak var viewController: UIViewController?

    // MARK: - Create Module
    static func createModule() -> UIViewController {

        let view = TodoViewController(nibName: nil, bundle: nil)
        let interactor = TodoInteractor()
        let router = TodoRouter()
        let presenter = TodoPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
