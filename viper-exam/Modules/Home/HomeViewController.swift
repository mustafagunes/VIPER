//
//  HomeViewController.swift
//  viper-exam
//
//  Created Mustafa GUNES on 19.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import UIKit
import SnapKit

class HomeViewController: UIViewController, HomeViewProtocol {

    // MARK: - Definitions
	var presenter: HomePresenterProtocol?
    
    // MARK: - Components
    let postButton = AppButton()
    let commentButton = AppButton()
    let albumButton = AppButton()
    let photoButton = AppButton()
    let todoButton = AppButton()
    let userButton = AppButton()

	override func viewDidLoad() {
        super.viewDidLoad()
        makeLayout()
    }
    
    // MARK: - posts, comments, albums, photos, todos, users list
    fileprivate func makeLayout() {
        self.title = "HOME"
        self.view.backgroundColor = .white
        self.createComponents()
    }
}

// MARK: - Create Components
extension HomeViewController {
    
    fileprivate func createComponents() {
        // MARK: - Button
        postButton.setTitle("Posts", for: .normal)
        commentButton.setTitle("Comments", for: .normal)
        albumButton.setTitle("Albums", for: .normal)
        photoButton.setTitle("Photos", for: .normal)
        todoButton.setTitle("Todos", for: .normal)
        userButton.setTitle("Users", for: .normal)
        
        // MARK: - StackView
        let stackView = UIStackView(arrangedSubviews: [postButton, commentButton, albumButton, photoButton, todoButton, userButton])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 15
        
        self.view.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.leading.trailing.equalTo(view).inset(30)
        }
    }
}
