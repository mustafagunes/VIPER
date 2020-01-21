//
//  AlbumCell.swift
//  viper-exam
//
//  Created by Mustafa GUNES on 21.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import UIKit

class AlbumCell: UICollectionViewCell, ReusableView, NibLoadableView {

    // MARK: - Global Definitions
    var album: Album!
    
    // MARK: - Components
    let titleLabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.makeLayout()
    }
    
    func setCell(album: Album) {
        self.album = album
        titleLabel.text = album.title
    }
    
    fileprivate func makeLayout() {
        
        self.layer.cornerRadius = 6
        self.backgroundColor = UIColor.random

        titleLabel.font = .systemFont(ofSize: 13)
        titleLabel.textColor = backgroundColor!.isDarkColor ? .white : .black
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.edges.equalToSuperview().inset(10)
        }
    }
}
