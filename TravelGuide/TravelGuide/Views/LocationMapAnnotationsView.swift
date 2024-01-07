//
//  LocationMapAnnotationsView.swift
//  TravelGuide
//
//  Created by Batuhan Akdemir on 7.01.2024.
//

import SwiftUI

struct LocationMapAnnotationsView: View {
    var body: some View {
        
        VStack (spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30 ,  height: 30)
                .font(.headline)
                .foregroundStyle(.white)
                .padding(6)
                .background(.customOrange)
                .cornerRadius(36)
            
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.customOrange)
                .frame(width: 10 , height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom , 40)
        }
    }
}

#Preview {
    LocationMapAnnotationsView()
}
