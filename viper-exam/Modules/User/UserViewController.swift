//
//  UserViewController.swift
//  viper-exam
//
//  Created Mustafa GUNES on 22.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import UIKit

class UserViewController: UIViewController {

    // MARK: - Definitions
	var presenter: UserPresenterProtocol?
    var user: [User] = [] {
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
        presenter?.getUsers()
    }
    
    fileprivate func makeLayout() {
        self.title = "USERS"
        self.view.backgroundColor = .viewBackground
        self.createComponents()
    }
}

// MARK: - Create Components
extension UserViewController {
    
    fileprivate func createComponents() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UserCell.self)
        collectionView.backgroundColor = .viewBackground
        
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

// MARK: - UserViewProtocol
extension UserViewController: UserViewProtocol {
    
    func setUsers(user: [User]) {
        self.user = user
        hideLoadingDialog()
    }
    
    func errorService(message: String) {
        hideLoadingDialog()
        showActivityPopup(title: message)
    }
}

// MARK: - UICollectionViewDataSource
extension UserViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return user.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UserCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.setCell(user: self.user[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension UserViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let cellWidth = width - 30
        let cellHeight = (15 + 20 + 5 + 20 + 10 + 230 + 15).toCGFloat!
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
