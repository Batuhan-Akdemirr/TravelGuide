//
//  Locations.swift
//  TravelGuide
//
//  Created by Batuhan Akdemir on 5.01.2024.
//

import Foundation
import MapKit


struct Location: Codable, Identifiable , Equatable, Hashable{
    let id: String
    let name: String
    let cityName: String
    let description: String
    let link: String
    let latitude: Double
    let longtitude: Double
    let imageNames: [String]
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
    }
    
   
}
