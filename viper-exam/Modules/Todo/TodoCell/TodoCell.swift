//
//  TodoCell.swift
//  viper-exam
//
//  Created by Mustafa GUNES on 22.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import UIKit

class TodoCell: UICollectionViewCell, ReusableView, NibLoadableView {
    
    // MARK: - Global Definitions
    var todo: Todo!
    
    // MARK: - Components
    let titleLabel = UILabel()
    let imageView = UIImageView()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.makeLayout()
    }
    
    func setCell(todo: Todo) {
        self.todo = todo
        
        titleLabel.text = todo.title
        imageView.image = todo.completed ? UIImage(named: "ic_checked") : UIImage(named: "ic_unchecked")
    }
    
    fileprivate func makeLayout() {
        
        self.layer.cornerRadius = 6
        self.backgroundColor = UIColor.random
        
        imageView.contentMode = .scaleAspectFit
        
        self.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.trailing.top.equalToSuperview().inset(5)
            make.height.width.equalTo(30)
        }

        titleLabel.font = .systemFont(ofSize: 14)
        titleLabel.textColor = backgroundColor!.isDarkColor ? .white : .black
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.textAlignment = .center
        
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.leading.trailing.bottom.top.equalToSuperview().inset(20)
        }
    }
}
