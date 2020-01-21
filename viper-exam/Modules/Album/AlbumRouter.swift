//
//  AlbumRouter.swift
//  viper-exam
//
//  Created Mustafa GUNES on 21.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import UIKit

class AlbumRouter: AlbumWireframeProtocol {

    // MARK: - Definitions
    weak var viewController: UIViewController?

    // MARK: - Create Module
    static func createModule() -> UIViewController {

        let view = AlbumViewController(nibName: nil, bundle: nil)
        let interactor = AlbumInteractor()
        let router = AlbumRouter()
        let presenter = AlbumPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
