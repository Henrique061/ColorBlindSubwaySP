//
//  ContentView.swift
//  ColorBlindSubwaySP
//
//  Created by Henrique Assis on 30/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            FilterView()
                .tabItem {
                    Label("Filtros", systemImage: "camera.filters")
                }
            ColorView()
                .tabItem {
                    Label("Cores", systemImage: "scribble.variable")
                }
            RouteView()
                .tabItem {
                    Label("Rotas", systemImage: "tram.circle.fill")
                }
            InfoView()
                .tabItem {
                    Label("Infos", systemImage: "info.circle")
                }
        }.accentColor(.black)
    }
}

//#Preview {
//    ContentView()
//}
