//
//  CommentCell.swift
//  viper-exam
//
//  Created by Mustafa GUNES on 21.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import UIKit

class CommentCell: UICollectionViewCell, ReusableView, NibLoadableView {

    // MARK: - Global Definitions
    var comment: Comment!
    
    // MARK: - Components
    let emailLabel = UILabel()
    let bodyLabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.makeLayout()
    }
    
    func setCell(comment: Comment) {
        self.comment = comment
        
        emailLabel.text = comment.email
        bodyLabel.text = comment.body
    }
    
    fileprivate func makeLayout() {
        
        self.layer.cornerRadius = 6
        self.backgroundColor = .systemTeal

        emailLabel.font = .systemFont(ofSize: 13)
        emailLabel.textColor = .black
        emailLabel.numberOfLines = 0
        emailLabel.lineBreakMode = .byWordWrapping
        
        bodyLabel.font = .systemFont(ofSize: 13)
        bodyLabel.textColor = .black
        bodyLabel.numberOfLines = 0
        bodyLabel.lineBreakMode = .byWordWrapping
        
        // MARK: - StackView
        let stackView = UIStackView(arrangedSubviews: [emailLabel, bodyLabel])
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
