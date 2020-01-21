//
//  PostViewController.swift
//  viper-exam
//
//  Created Mustafa GUNES on 20.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import UIKit
import SnapKit

class PostViewController: UIViewController {

    // MARK: - Definitions
    var presenter: PostPresenterProtocol?
    var posts: [Post] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // MARK: - Components
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())

	override func viewDidLoad() {
        super.viewDidLoad()
        makeLayout()
    }
    
    fileprivate func makeLayout() {
        self.title = "POSTS"
        self.view.backgroundColor = .white
        self.createComponents()
        self.presenter?.getPosts()
    }
}

// MARK: - Create Components
extension PostViewController {
    
    fileprivate func createComponents() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PostCell.self)
        collectionView.backgroundColor = .white
        
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension PostViewController: PostViewProtocol {
    
    func setPost(posts: [Post]) {
        self.posts = posts
    }
    
    func errorService(message: String) {
        self.showActivityPopup(title: message)
    }
}

// MARK: - UICollectionViewDelegate
extension PostViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: -
    }
}

// MARK: - UICollectionViewDataSource
extension PostViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PostCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.setCell(post: self.posts[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PostViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let post = self.posts[indexPath.row]
        let width = UIScreen.main.bounds.width
        let cellWidth = width - 40
        let labelWidth = cellWidth - 20
        let titleHeight = post.title.height(withConstrainedWidth: labelWidth, font: .systemFont(ofSize: 13))
        let bodyHeight = post.body.height(withConstrainedWidth: labelWidth, font: .systemFont(ofSize: 13))
        let cellHeight = titleHeight + bodyHeight
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
