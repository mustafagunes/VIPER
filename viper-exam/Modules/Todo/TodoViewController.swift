//
//  TodoViewController.swift
//  viper-exam
//
//  Created Mustafa GUNES on 22.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import UIKit

class TodoViewController: UIViewController {

    // MARK: - Definitions
	var presenter: TodoPresenterProtocol?
    var todos: [Todo] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // MARK: - Components
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())

	override func viewDidLoad() {
        super.viewDidLoad()
        makeLayout()
        showLoadingDialog()
        presenter?.getTodos()
    }
    
    fileprivate func makeLayout() {
        self.title = "TODOS"
        self.view.backgroundColor = .viewBackground
        self.createComponents()
    }
}

// MARK: - Create Components
extension TodoViewController {
    
    fileprivate func createComponents() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(TodoCell.self)
        collectionView.backgroundColor = .viewBackground
        
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { [weak self] make in
            guard let self = self else { return }
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

// MARK: - TodoViewProtocol
extension TodoViewController: TodoViewProtocol {
    
    func setTodos(todos: [Todo]) {
        self.todos = todos
        hideLoadingDialog()
    }
    
    func errorService(message: String) {
        hideLoadingDialog()
        showActivityPopup(title: message)
    }
}

// MARK: - UICollectionViewDataSource
extension TodoViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return todos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TodoCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.setCell(todo: self.todos[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension TodoViewController: UICollectionViewDelegateFlowLayout {
    
    private func calculateCellSize() -> CGSize {
        let width = UIScreen.main.bounds.width / 2
        let cellWidth = width - 30
        let cellHeight = cellWidth
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = calculateCellSize()
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
