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
        self.view.backgroundColor = .viewBackground
        self.setNavigationbar()
        self.createComponents()
    }
    
    fileprivate func setNavigationbar() {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.backgroundColor = .navBarBackground
            navigationController?.navigationBar.barStyle = .black
            navigationController?.navigationBar.tintColor = UIColor(hue:0.620, saturation:0.75, brightness:1.0, alpha:1)
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        } else {
            navigationController?.navigationBar.backgroundColor = .navBarBackground
            navigationController?.navigationBar.barStyle = .default
            navigationController?.navigationBar.tintColor = UIColor(hue:0.620, saturation:0.75, brightness:1.0, alpha:1)
        }
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
            presenter?.showPhotos()
        case todoButton:
            presenter?.showTodos()
        case userButton:
            presenter?.showUsers()
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
