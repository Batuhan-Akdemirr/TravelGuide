//
//  LocationsViewModel.swift
//  TravelGuide
//
//  Created by Batuhan Akdemir on 6.01.2024.
//

import Foundation

@Observable
class LocationsViewModel {
     var locationService = LocationService()
     var locations: [Location] = []

    init() {
        Task {
         await fetcData()
        }
        
    }
    
    func fetcData()  async{
        self.locations = await locationService.loadData()
    }

   
}
