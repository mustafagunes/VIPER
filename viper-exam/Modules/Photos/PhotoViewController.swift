//
//  PhotoViewController.swift
//  viper-exam
//
//  Created Mustafa GUNES on 21.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import UIKit

class PhotoViewController: UIViewController {

    // MARK: - Definitions
	var presenter: PhotoPresenterProtocol?
    var photos: [Photo] = [] {
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
        self.presenter?.getPhotos()
    }
    
    fileprivate func makeLayout() {
        self.title = "PHOTOS"
        self.view.backgroundColor = .viewBackground
        self.createComponents()
    }
}

// MARK: - Create Components
extension PhotoViewController {
    
    fileprivate func createComponents() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PhotoCell.self)
        collectionView.backgroundColor = .viewBackground
        
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

// MARK: - PhotoViewProtocol
extension PhotoViewController: PhotoViewProtocol {
    
    func setPhotos(photos: [Photo]) {
        self.photos = photos
        hideLoadingDialog()
    }
    
    func errorService(message: String) {
        hideLoadingDialog()
        showActivityPopup(title: message)
    }
}

// MARK: - UICollectionViewDataSource
extension PhotoViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PhotoCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.setCell(photo: self.photos[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PhotoViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width / 3
        let cellWidth = width - 25
        let cellHeight = cellWidth
        return CGSize(width: cellWidth, height: cellHeight)
    }
}

