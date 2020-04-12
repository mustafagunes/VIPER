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
import RxSwift
import RxCocoa

class PostViewController: UIViewController {

    // MARK: - Definitions
    let disposeBag = DisposeBag()
    var presenter: PostPresenterProtocol?
    var posts = BehaviorRelay<[Post]>(value: [])
    
    // MARK: - Components
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())

	override func viewDidLoad() {
        super.viewDidLoad()
        makeLayout()
        setObserver()
    }
    
    fileprivate func setObserver() {
        posts.asObservable()
        .bind(to: collectionView.rx.items(cellIdentifier: PostCell.identifier, cellType: PostCell.self)) { (index, post, cell) in
            cell.setCell(post: self.posts.value[index])
        }
    }
    
    fileprivate func makeLayout() {
        self.title = "POSTS"
        self.view.backgroundColor = .viewBackground
        self.createComponents()
        self.showLoadingDialog()
        self.presenter?.getPosts()
    }
}

// MARK: - Create Components
extension PostViewController {
    
    fileprivate func createComponents() {
        
        collectionView.rx.setDelegate(self).disposed(by: disposeBag)
        collectionView.register(PostCell.self)
        collectionView.backgroundColor = .viewBackground
        
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension PostViewController: PostViewProtocol {
    
    func setPost(posts: [Post]) {
        self.posts.accept(posts)
        self.hideLoadingDialog()
    }
    
    func errorService(message: String) {
        self.hideLoadingDialog()
        self.showActivityPopup(title: message)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PostViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let post = self.posts.value[indexPath.row]
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
