//
//  LoadingView.swift
//  viper-exam
//
//  Created by Mustafa GUNES on 20.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
    // MARK: - Objects & Definition
    private lazy var loadingLabel = UILabel()
    private lazy var loadingView = UIView()
    private lazy var activityIndicatorView = UIActivityIndicatorView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        self.backgroundColor = .clear
        
        self.addSubview(loadingView)
        loadingView.layer.cornerRadius = 12
        loadingView.backgroundColor = UIColor.darkText.withAlphaComponent(0.8)
        loadingView.addBlurAreaForLoading(area: loadingView.bounds, style: .dark)
        loadingView.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(140)
            make.centerX.centerY.equalTo(self)
        }
        
        self.loadingView.addSubview(activityIndicatorView)
        activityIndicatorView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        activityIndicatorView.color = .white
        activityIndicatorView.snp.makeConstraints { (make) in
            make.width.height.equalTo(30)
            make.centerX.equalTo(self).inset(-5)
            make.centerY.equalTo(self)
        }
        activityIndicatorView.startAnimating()
        
        self.loadingView.addSubview(loadingLabel)
        loadingLabel.textColor = .white
        loadingLabel.font = UIFont.systemFont(ofSize: 20)
        loadingLabel.text = "Loading..."
        loadingLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(activityIndicatorView)
            make.top.equalTo(activityIndicatorView.snp.bottom).offset(10)
        }
    }
}
