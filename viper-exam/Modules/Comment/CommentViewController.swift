//
//  CommentViewController.swift
//  viper-exam
//
//  Created Mustafa GUNES on 21.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import UIKit

class CommentViewController: UIViewController {

    // MARK: - Definitions
	var presenter: CommentPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getComments()
    }
    
    fileprivate func makeLayout() {
        self.title = "COMMENTS"
        self.view.backgroundColor = .white
        self.createComponents()
    }
}

// MARK: - Create Components
extension CommentViewController {
    
    fileprivate func createComponents() {
        
    }
}

// MARK: - CommentViewProtocol
extension CommentViewController: CommentViewProtocol {
    
    func setComments(comments: [Comment]) {
        // TODO: - set comments
    }
    
    func errorService(message: String) {
        self.showActivityPopup(title: message)
    }
}
