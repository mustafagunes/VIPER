//
//  AlbumViewController.swift
//  viper-exam
//
//  Created Mustafa GUNES on 21.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import UIKit

class AlbumViewController: UIViewController {

    // MARK: - Definitions
	var presenter: AlbumPresenterProtocol?
    var albums: [Album] = [] {
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
        presenter?.getAlbums()
    }
    
    fileprivate func makeLayout() {
        self.title = "ALBUMS"
        self.view.backgroundColor = .white
        self.createComponents()
    }
}

// MARK: - Create Components
extension AlbumViewController {
    
    fileprivate func createComponents() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(AlbumCell.self)
        collectionView.backgroundColor = .white
        
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

// MARK: - AlbumViewProtocol
extension AlbumViewController: AlbumViewProtocol {
    
    func setAlbums(albums: [Album]) {
        self.albums = albums
        hideLoadingDialog()
    }
    
    func errorService(message: String) {
        hideLoadingDialog()
        showActivityPopup(title: message)
    }
}

// MARK: - UICollectionViewDataSource
extension AlbumViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: AlbumCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.setCell(album: self.albums[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension AlbumViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let album = self.albums[indexPath.row]
        let cellWidth = (UIScreen.main.bounds.width / 3) - 20
        let labelWidth = cellWidth
        let cellHeight = album.title.height(withConstrainedWidth: labelWidth, font: .systemFont(ofSize: 13)) + 15
        return CGSize(width: cellWidth, height: cellHeight)
    }
}