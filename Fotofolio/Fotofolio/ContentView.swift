//
//  ContentView.swift
//  Fotofolio
//
//  Created by Bryce on 10/19/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var imageSliderController: ImageSliderController = ImageSliderController()
    @StateObject var themeController: ThemeController = ThemeController()

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            NavigationBar()
        }
        .environmentObject(imageSliderController)
        .environmentObject(themeController)
    }
}

#Preview {
    ContentView()
}
