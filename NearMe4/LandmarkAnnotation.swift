//
//  LandmarkAnnotation.swift
//  NearMe4
//
//  Created by Shivum telang on 7/24/24.
//


import MapKit
import UIKit


final class LandmarkAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D

    init(landmark: Landmark) {
        self.title = landmark.name
        self.coordinate = landmark.coordinate
    }
}
