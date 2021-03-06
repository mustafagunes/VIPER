//
//  PostCell.swift
//  viper-exam
//
//  Created by Mustafa GUNES on 20.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import UIKit
import SnapKit

class PostCell: UICollectionViewCell, ReusableView, NibLoadableView {
    
    // MARK: - Global Definitions
    var post: Post!
    
    // MARK: - Components
    let titleLabel = UILabel()
    let bodyLabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.makeLayout()
    }
    
    func setCell(post: Post) {
        self.post = post
        
        titleLabel.text = post.title
        bodyLabel.text = post.body
    }
    
    fileprivate func makeLayout() {
        
        self.layer.cornerRadius = 6
        self.backgroundColor = UIColor.random

        titleLabel.font = .systemFont(ofSize: 13)
        titleLabel.textColor = backgroundColor!.isDarkColor ? .white : .black
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        
        bodyLabel.font = .systemFont(ofSize: 13)
        bodyLabel.textColor = backgroundColor!.isDarkColor ? .white : .black
        bodyLabel.numberOfLines = 0
        bodyLabel.lineBreakMode = .byWordWrapping
        
        // MARK: - StackView
        let stackView = UIStackView(arrangedSubviews: [titleLabel, bodyLabel])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        self.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.edges.equalToSuperview().inset(10)
        }
    }
}
