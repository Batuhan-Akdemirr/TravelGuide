//
//  ContentView.swift
//  TravelGuide
//
//  Created by Batuhan Akdemir on 5.01.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var locationService = LocationService()
  
    var body: some View {
        VStack {
           
            ForEach(locationService.results) { item in
                Text("\(item.cityName)")
            }
            Button("Tap") {
                locationService.fetchData()
          
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
