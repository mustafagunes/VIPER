//
//  UIViewControllerExtensions.swift
//  viper-exam
//
//  Created by Mustafa GUNES on 20.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showLoadingDialog() {
        self.view.endEditing(true)
        self.hideLoadingDialog()
        LoadingViewPresenter.shared.show()
    }
    
    func hideLoadingDialog() {
        LoadingViewPresenter.shared.hide()
    }
    
    func showActivityPopup(title: String, message: String? = nil) {
        let alert = UIAlertController(title: title, message: message)
        self.present(alert, animated: true, completion: nil)
    }
}
