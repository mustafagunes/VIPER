//
//  UIViewExtension.swift
//  viper-exam
//
//  Created by Mustafa GUNES on 20.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import UIKit

extension UIView {
    
    func addBlurAreaForLoading(area: CGRect, style: UIBlurEffect.Style) {
        let effect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: effect)
        let container = UIView(frame: area)
        blurView.frame = CGRect(x: 0, y: 0, width: area.width, height: area.height)
        container.addSubview(blurView)
        self.insertSubview(container, at: 1)
    }
}
