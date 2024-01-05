//
//  LocationService.swift
//  TravelGuide
//
//  Created by Batuhan Akdemir on 5.01.2024.
//

import Foundation

@Observable
class LocationService {
    
    let url = "https://636cc87fab4814f2b26e1ba4.mockapi.io/places"
   var results =  [Location]()
    
    func fetchData() {
          guard let url = URL(string: url) else {
              print("Invalid URL")
              return
          }

          URLSession.shared.dataTask(with: url ) { data, response, error in
              if let error = error {
                  print(error)
              } else if let data = data {
                  if let decodedData = try? JSONDecoder().decode([Location].self, from: data) {
                      DispatchQueue.main.async {
                          self.results = decodedData
                      }
                  } else {
                      print("Failed to decode data")
                  }
              }
          }
          .resume()
        
      }
    
    
    init() {
        fetchData()
    }
}
