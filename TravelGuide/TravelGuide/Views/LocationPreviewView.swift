//
//  LocationPreviewView.swift
//  TravelGuide
//
//  Created by Batuhan Akdemir on 6.01.2024.
//

import SwiftUI

struct LocationPreviewView: View {
    
    @Environment(LocationsViewModel.self) private var vm
    let location: Location
    
    var body: some View {
        
        HStack(alignment: .bottom , spacing: 0){
            VStack(alignment: .leading, spacing: 16 ) {
                imageSection
                titleSection
            }
         
            VStack(spacing: 8) {
             learnMoreButton
             nextButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
            .fill(.ultraThinMaterial)
            .offset(y : 65)
        )
        .cornerRadius(10)
    }
}

#Preview {
    LocationPreviewView(location: Location(id: "1", name: "Colosseum", cityName: "Rome",
    description: "The Colosseum is an oval amphitheatre in the centre of the city of Rome, Italy, just east of the Roman Forum. It is the largest ancient amphitheatre ever built, and is still the largest standing amphitheatre in the world today, despite its age.",
    link: "https://en.wikipedia.org/wiki/Colosseum", latitude: 41.8902, longtitude: 12.4922,
    imageNames: [ "rome-colosseum-1","rome-colosseum-2","rome-colosseum-3"]))
    .environment(LocationsViewModel())
}



extension LocationPreviewView {
    
    private var imageSection: some View {
        
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                
            }
        }
        .padding()
        .background(.white)
        .cornerRadius(10)
    }
    
    
    private var titleSection : some View {
        VStack(alignment: .leading , spacing: 4) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
                .lineLimit(1)
                .minimumScaleFactor(0.5) 
            
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
    private var learnMoreButton : some View {
        Button {
            vm.sheetLocation = location
        } label: {
            
            Text("Learn more")
                .font(.headline)
                .frame(width: 125 , height: 35)
        }
        .buttonStyle(.borderedProminent)
        .tint(.customOrange)
    }
    
    
    private var nextButton: some View {
        Button {
            vm.nextButtonPressed()
        } label: {
            
            Text("Next")
                .font(.headline)
                .frame(width: 125 , height: 35)
                .foregroundStyle(.customOrange)
                .fontWeight(.bold)
        }
        .buttonStyle(.bordered)
    }
}
