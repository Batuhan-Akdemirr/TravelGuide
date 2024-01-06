//
//  LocationsView.swift
//  TravelGuide
//
//  Created by Batuhan Akdemir on 5.01.2024.
//

import MapKit
import SwiftUI

struct LocationsView: View {
    
    @Environment(LocationsViewModel.self) private var vm : LocationsViewModel
 
    var body: some View {
        
        @Bindable var bindable = vm
        
        ZStack {
            Map(coordinateRegion: $bindable.mapRegion)
            
            
        }
    }
    
    init() {
        
    }
}


#Preview {
    LocationsView()
        .environment(LocationsViewModel())
}
