//
//  LocationDetailView.swift
//  TravelGuide
//
//  Created by Batuhan Akdemir on 7.01.2024.
//

import MapKit
import SwiftUI

struct LocationDetailView: View {
    
    let location: Location
    @Environment(LocationsViewModel.self) private var vm
    
    var body: some View {
       
        ScrollView {
            
            VStack {
                imageSection
                    .shadow(color: .black.opacity(0.3), radius: 20, x: 0 , y: 10)
                
                VStack(alignment: .leading, spacing: 16) {
                    titleSection
                    Divider()
                    descrptionSection
                    Divider()
                    mapLayer
                    
                }
                .frame(maxWidth: .infinity , alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(backButton , alignment: .topLeading)
    }
}

#Preview {
    LocationDetailView(location: Location(id: "", name: "", cityName: "", description: "", link: "", latitude: 1, longtitude:1, imageNames: [ ]))
}


extension LocationDetailView {
    private var imageSection : some View {
        TabView {
            ForEach(location.imageNames, id: \.self) { imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
    
    private var titleSection : some View {
        VStack(alignment:.leading , spacing: 8) {
            
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(location.cityName)
                .font(.title3)
                .foregroundStyle(.secondary)
        }

    }
    
    private var descrptionSection : some View {
        VStack(alignment:.leading , spacing: 16) {
            Text(location.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            if  let url = URL(string: location.link) {
                Link("Read more on Wikipedia", destination: url )
                    .font(.headline)
                    .tint(.blue)
            }
         
        }

    }
    
    private var  mapLayer : some View {
        Map(coordinateRegion:  .constant(MKCoordinateRegion(
            center: location.coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005 ))),
            annotationItems: [location]) { location in
            
            MapAnnotation(coordinate: location.coordinate) {
                LocationMapAnnotationsView()
                    .shadow(radius: 10)
            }
        }
            .allowsHitTesting(false)
            .aspectRatio(1,contentMode: .fit)
            .cornerRadius(10)
    }
    
    
    private var backButton: some View {
        Button {
            vm.sheetLocation = nil 
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundStyle(.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }
    }
}
