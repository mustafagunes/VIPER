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
    var comments: [Comment] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // MARK: - Components
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())

	override func viewDidLoad() {
        super.viewDidLoad()
        makeLayout()
        self.showLoadingDialog()
        presenter?.getComments()
    }
    
    fileprivate func makeLayout() {
        self.title = "COMMENTS"
        self.view.backgroundColor = .viewBackground
        self.createComponents()
    }
}

// MARK: - Create Components
extension CommentViewController {
    
    fileprivate func createComponents() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CommentCell.self)
        collectionView.backgroundColor = .viewBackground
        
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { [weak self] make in
            guard let self = self else { return }
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

// MARK: - CommentViewProtocol
extension CommentViewController: CommentViewProtocol {
    
    func setComments(comments: [Comment]) {
        self.comments = comments
        self.hideLoadingDialog()
    }
    
    func errorService(message: String) {
        self.hideLoadingDialog()
        self.showActivityPopup(title: message)
    }
}

// MARK: - UICollectionViewDataSource
extension CommentViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CommentCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.setCell(comment: self.comments[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CommentViewController: UICollectionViewDelegateFlowLayout {
    
    private func calculateCellSize(at indexPath: IndexPath) -> CGSize {
        let comment = self.comments[indexPath.row]
        let width = UIScreen.main.bounds.width
        let cellWidth = width - 40
        let labelWidth = cellWidth - 20
        let titleHeight = comment.email.height(withConstrainedWidth: labelWidth, font: .systemFont(ofSize: 13))
        let bodyHeight = comment.body.height(withConstrainedWidth: labelWidth, font: .systemFont(ofSize: 13))
        let cellHeight = titleHeight + bodyHeight
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = calculateCellSize(at: indexPath)
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
