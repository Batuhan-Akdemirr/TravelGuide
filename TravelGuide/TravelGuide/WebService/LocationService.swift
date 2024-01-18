//
//  LocationService.swift
//  TravelGuide
//
//  Created by Batuhan Akdemir on 5.01.2024.
//

import Foundation

class LocationService {
    
    var results = [Location]()
    let baseURL = "https://636cc87fab4814f2b26e1ba4.mockapi.io/places"
    
     func loadData() async -> [Location] {
         guard let url = URL(string: baseURL) else {
             print("Invalid URL")
             return []
         }

         do {
             let (data, _) = try await URLSession.shared.data(from: url)

             if let decodedResponse = try? JSONDecoder().decode([Location].self, from: data) {
                 self.results = decodedResponse
             }

         } catch {
             print("Upsss there was an error \(error.localizedDescription)")
    
         }
         
         return results
         
     }
}
