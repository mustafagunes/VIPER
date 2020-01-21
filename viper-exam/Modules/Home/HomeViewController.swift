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
    
    @objc func buttonTapped(sender: UIButton) {
        switch sender {
        case postButton:
            presenter?.showPosts()
        case commentButton:
            presenter?.showComments()
        case albumButton:
            presenter?.showAlbums()
        case photoButton:
            break
        case todoButton:
            break
        case userButton:
            break
        default:
            break
        }
    }
}

// MARK: - Create Components
extension HomeViewController {
    
    fileprivate func createComponents() {
        
        // MARK: - Button
        postButton.setTitle("Posts", for: .normal)
        postButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        commentButton.setTitle("Comments", for: .normal)
        commentButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        albumButton.setTitle("Albums", for: .normal)
        albumButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        photoButton.setTitle("Photos", for: .normal)
        photoButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        todoButton.setTitle("Todos", for: .normal)
        todoButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        userButton.setTitle("Users", for: .normal)
        userButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
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
