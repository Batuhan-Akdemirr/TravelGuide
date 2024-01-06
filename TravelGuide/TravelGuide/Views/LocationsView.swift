//
//  LocationsView.swift
//  TravelGuide
//
//  Created by Batuhan Akdemir on 5.01.2024.
//

import SwiftUI

struct LocationsView: View {
    @Environment(LocationsViewModel.self) private var vm

    var body: some View {
        List {
            ForEach(vm.locations) { location in
                Text(location.name)
            }

        }
    }
}


#Preview {
    LocationsView()
        .environment(LocationsViewModel())
}
