//
//  PostRouter.swift
//  viper-exam
//
//  Created Mustafa GUNES on 20.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import UIKit

class PostRouter: PostWireframeProtocol {

    // MARK: - Definitions
    weak var viewController: UIViewController?

    // MARK: - Create Module
    static func createModule() -> UIViewController {

        let view = PostViewController(nibName: nil, bundle: nil)
        let interactor = PostInteractor()
        let router = PostRouter()
        let presenter = PostPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
