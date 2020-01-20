//
//  PostViewController.swift
//  viper-exam
//
//  Created Mustafa GUNES on 20.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import UIKit

class PostViewController: UIViewController, PostViewProtocol {

    // MARK: - Definitions
	var presenter: PostPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        makeLayout()
    }
    
    fileprivate func makeLayout() {
        self.title = "POSTS"
        self.view.backgroundColor = .white
    }
}
