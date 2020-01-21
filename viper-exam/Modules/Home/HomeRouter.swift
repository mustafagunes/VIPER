//
//  HomeRouter.swift
//  viper-exam
//
//  Created Mustafa GUNES on 19.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import UIKit

class HomeRouter {

    // MARK: - Definitions
    weak var viewController: UIViewController?

    // MARK: - Create Module
    static func createModule() -> UIViewController {

        let view = HomeViewController(nibName: nil, bundle: nil)
        let router = HomeRouter()
        let presenter = HomePresenter(interface: view, router: router)

        view.presenter = presenter
        router.viewController = view

        return view
    }
}

// MARK: - HomeWireframeProtocol
extension HomeRouter: HomeWireframeProtocol {
    
    // MARK: - Show PostViewController
    func showPosts() {
        let postVC = PostRouter.createModule()
        viewController?.navigationController?.pushViewController(postVC, animated: true)
    }
    
    // MARK: - Show CommentViewController
    func showComments() {
        let commentVC = CommentRouter.createModule()
        viewController?.navigationController?.pushViewController(commentVC, animated: true)
    }
    
    // MARK: - Show AlbumViewController
    func showAlbums() {
        let albumVC = AlbumRouter.createModule()
        viewController?.navigationController?.pushViewController(albumVC, animated: true)
    }
}
