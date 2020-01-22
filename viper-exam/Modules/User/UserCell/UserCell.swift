//
//  UserCell.swift
//  viper-exam
//
//  Created by Mustafa GUNES on 22.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import UIKit
import MapKit

class UserCell: UICollectionViewCell, ReusableView, NibLoadableView {
    
    // MARK: - Global Definitions
    var user: User!
    
    // MARK: - Components
    let titleLabel = UILabel()
    let emailLabel = UILabel()
    let mapView = MKMapView()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.makeLayout()
    }
    
    func setCell(user: User) {
        self.user = user
        
        titleLabel.text = user.name
        emailLabel.text = user.email
        setMapView(user: user)
    }
    
    fileprivate func setMapView(user: User) {
        let userCoordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: user.address.geo.lat.toDouble ?? 0, longitude: user.address.geo.lng.toDouble ?? 0)
        let annotation = MapAnnotation(title: user.name, subTitle: user.email, coordinate: userCoordinate)
        
        mapView.isScrollEnabled = false
        mapView.isZoomEnabled = false
        mapView.isPitchEnabled = false
        
        mapView.addAnnotation(annotation)
        mapView.setRegion(annotation.region, animated: true)
    }
    
    fileprivate func makeLayout() {
        
        self.layer.cornerRadius = 6
        self.backgroundColor = UIColor.random
        
        titleLabel.font = .boldSystemFont(ofSize: 14)
        titleLabel.textColor = backgroundColor!.isDarkColor ? .white : .black
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.textAlignment = .center
        
        emailLabel.font = .systemFont(ofSize: 12)
        emailLabel.textColor = backgroundColor!.isDarkColor ? .white : .black
        emailLabel.numberOfLines = 0
        emailLabel.lineBreakMode = .byWordWrapping
        emailLabel.textAlignment = .center

        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalTo(self).inset(15)
            make.height.equalTo(20)
        }
        
        self.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.height.equalTo(20)
        }
        
        mapView.layer.cornerRadius = 6
        
        self.addSubview(mapView)
        mapView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.height.equalTo(230)
            make.top.equalTo(emailLabel.snp.bottom).offset(10)
            make.trailing.leading.bottom.equalToSuperview().inset(15)
        }
    }
}
