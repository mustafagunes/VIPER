//
//  PhotoCell.swift
//  viper-exam
//
//  Created by Mustafa GUNES on 21.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell, ReusableView, NibLoadableView {

    // MARK: - Global Definitions
    var photo: Photo!
    
    // MARK: - Components
    let titleLabel = UILabel()
    let imageView = UIImageView()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.makeLayout()
    }
    
    func setCell(photo: Photo) {
        self.photo = photo
        
        titleLabel.text = photo.title
        imageView.set(photo.thumbnailURL, showActivityIndicator: true)
    }
    
    fileprivate func makeLayout() {
        
        self.layer.cornerRadius = 6
        self.backgroundColor = .black
        
        imageView.contentMode = .scaleAspectFill
        
        self.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        titleLabel.font = .systemFont(ofSize: 11)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.textAlignment = .center
        
        imageView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.height.equalTo(15)
            make.bottom.equalTo(imageView.snp.bottom).inset(5)
            make.leading.trailing.equalTo(imageView).inset(10)
        }
    }
}
