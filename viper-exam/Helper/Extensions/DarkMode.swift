//
//  DarkMode.swift
//  viper-exam
//
//  Created by Mustafa GUNES on 31.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import UIKit

extension UIColor {
    
    // MARK: - ViewColors
    /// Light mode color is White. Dark mode color is Dark.
    static var viewBackground: UIColor {
        if #available(iOS 13, *) {
            return UIColor(named: "viewBackground")!
        }
        return .white
    }
    
    /// Light mode color is White. Dark mode color is Dark.
    static var navBarBackground: UIColor {
        if #available(iOS 13, *) {
            return UIColor(named: "navBarBackground")!
        }
        return .white
    }
}
