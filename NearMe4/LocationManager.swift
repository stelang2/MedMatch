//
//  LocationManager.swift
//  NearMe4
//
//  Created by Shivum telang on 7/24/24.
//

//
//  LocationManager.swift
//  NearMe2
//
//  Created by Shivum telang on 7/13/24.
//

//
//  LocationManager.swift
//  NearMeProject
//
//  Created by Shivum telang on 7/4/24.
//

import Foundation
import MapKit

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    @Published var location:CLLocation? = nil
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
    }
}
extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        self.location = location
    }
}

