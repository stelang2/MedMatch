//
//  LMGeoConverter.swift
//  NearMe4
//
//  Created by Shivum telang on 7/26/24.
//

import CoreLocation
import SwiftUI

class LMGeoConverter: ObservableObject {
    @Published var coordinate: CLLocationCoordinate2D?
    private let geocoder = CLGeocoder()
    
    func geocodeAddress(address: String) {
        geocoder.geocodeAddressString(address) { [weak self] (placemarks, error) in
            if let error = error {
                print("Geocoding error: \(error)")
                return
            }
            
            if let placemark = placemarks?.first, let location = placemark.location {
                DispatchQueue.main.async {
                    self?.coordinate = location.coordinate
                }
            }
        }
    }
}
