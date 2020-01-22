//
//  UIImageViewExtensions.swift
//  viper-exam
//
//  Created by Mustafa GUNES on 21.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    static let fadeAnimation = KingfisherOptionsInfoItem.transition(ImageTransition.fade(0.2))
    
    func set(_ url: String, placeholder: UIImage? = nil, showActivityIndicator: Bool = false) {
        self.kf.setImage(with: URL(string: url), placeholder: placeholder, options: [UIImageView.fadeAnimation])
    }
}

