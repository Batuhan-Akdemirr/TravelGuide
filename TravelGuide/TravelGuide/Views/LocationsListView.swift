//
//  LocationsListView.swift
//  TravelGuide
//
//  Created by Batuhan Akdemir on 6.01.2024.
//

import SwiftUI

struct LocationsListView: View {
    
    @Environment(LocationsViewModel.self) private var vm
    var body: some View {
      
        List{
            ForEach(vm.locations) { location in
                
                Button {
                    vm.showNextLocation(location: location)
                } label: {
                    listrowView(location)
                }
                .padding(.vertical ,4)
                .listRowBackground(Color.clear)

            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    LocationsListView()
        .environment(LocationsViewModel())
}


extension LocationsListView {
    
    private func listrowView(_ location: Location)  -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45 , height: 45)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading ){
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth : .infinity , alignment: .leading)
        }
    }
}
