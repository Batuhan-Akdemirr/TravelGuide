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
            mapLayer
                .ignoresSafeArea()
          
            VStack(spacing: 0) {
                header
                    .padding()
                Spacer()
                locationsPreviewStack
              
            }
        }
        .sheet(item: $bindable.sheetLocation, onDismiss: nil) { location in
            LocationDetailView(location: location)
        }
    }
}


#Preview {
    LocationsView()
        .environment(LocationsViewModel())
}


extension LocationsView {
    
    //MARK: COMPONENTS
    
    private var header: some View {
        
        VStack {
            Button(action: vm.toggleLocationsList) {
                Text(vm.currentLocation.name + ", " + vm.currentLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundStyle(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                    }
                    .animation(.none, value: vm.currentLocation)
                    
            }
            .foregroundStyle(.primary)

            
            if vm.showLocationsList {
                LocationsListView()
            }
       
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow( color: .black.opacity(0.3), radius: 20, x: 0 , y: 15)
        
    }
    
    
    private var  mapLayer : some View {
        @Bindable var bindable = vm
        return  Map(coordinateRegion: $bindable.mapRegion ,
                     annotationItems: vm.locations,
                     annotationContent:{ location in
                     MapAnnotation(coordinate: location.coordinate) {
                         LocationMapAnnotationsView()
                             .scaleEffect(vm.currentLocation == location   ? 1 : 0.7)
                             .shadow(radius: 10)
                             .onTapGesture {
                                 vm.showNextLocation(location: location)
                             }
                     }
                   }
                 )
    }
    
    
    private var locationsPreviewStack : some View {
        ZStack {
            ForEach(vm.locations) { location in
                if(vm.currentLocation == location) {
                    LocationPreviewView(location: location)
                        .shadow(color: .black.opacity(0.3), radius: 20)
                        .padding()
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing) ,
                            removal: .move(edge: .leading))
                        )
                }
              
            }
        }
    }
}
