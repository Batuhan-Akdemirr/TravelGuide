//
//  TravelGuideApp.swift
//  TravelGuide
//
//  Created by Batuhan Akdemir on 5.01.2024.
//

import SwiftUI

@main
struct TravelGuideApp: App {
    @State private var vm = LocationsViewModel()
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environment(vm)
        }
    }
}
