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
     var currentLocation : Location = Location(id: "1", name: "", cityName: "", description: "", link: "", latitude: 0.0, longtitude: 0.0, imageNames: []) {
        didSet {
            updateCurrentRegion(location: currentLocation)
        }
    }
    
    var mapRegion : MKCoordinateRegion =  MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    var showLocationsList = false
    
    init() {
        Task {
            await fetcData()
            self.currentLocation = locations.first!
            self.updateCurrentRegion(location: locations.first!)
        }
        
    }
    
   private func fetcData()  async{
        self.locations = await locationService.loadData()
      
    }
    
    private func updateCurrentRegion(location: Location) {
     
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
            currentLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
        
        guard let currentIndex = locations.firstIndex(where:  {  $0 == currentLocation} ) else {
            print("Error")
            return
        }
        
        
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            
            guard  let firstLocation = locations.first else {
                return
            }
            showNextLocation(location: firstLocation)
            return
        }
        
        
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }

   
}
