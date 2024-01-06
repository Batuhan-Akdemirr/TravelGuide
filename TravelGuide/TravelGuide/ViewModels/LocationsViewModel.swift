//
//  LocationsViewModel.swift
//  TravelGuide
//
//  Created by Batuhan Akdemir on 6.01.2024.
//

import Foundation
import MapKit
import SwiftUI

@Observable
class LocationsViewModel {
    
     var locationService = LocationService()
     var locations: [Location] = []
     var mapLocation : Location = Location(id: "1", name: "", cityName: "", description: "", link: "", latitude: 0.0, longtitude: 0.0, imageNames: [ ]) {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    var mapRegion : MKCoordinateRegion =  MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    var showLocationsList = false
    
    init() {
        Task {
            await fetcData()
            self.mapLocation = locations.first!
            self.updateMapRegion(location: locations.first!)
        }
        
    }
    
   private func fetcData()  async{
        self.locations = await locationService.loadData()
      
    }
    
    private func updateMapRegion(location: Location) {
     
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinate,
                span: mapSpan)
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }

   
}
