//
//  MapAnnotation.swift
//  viper-exam
//
//  Created by Mustafa GUNES on 22.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import MapKit

final class MapAnnotation: NSObject, MKAnnotation {
    
    var title: String?
    var subTitle: String
    var coordinate: CLLocationCoordinate2D
    
    var region: MKCoordinateRegion {
        let span = MKCoordinateSpan(latitudeDelta: 0.6, longitudeDelta: 0.6)
        return MKCoordinateRegion(center: coordinate, span: span)
    }
    
    init(title: String, subTitle: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subTitle = subTitle
        self.coordinate = coordinate
        super.init()
    }
}
