//
//  LocationModel.swift
//  AfricanAnimals
//
//  Created by M_2195552 on 2023-05-26.
//

import SwiftUI
import MapKit

struct NationalParkLocation: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    // Computer Property
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
