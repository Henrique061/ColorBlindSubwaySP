//
//  HomeView.swift
//  ColorBlindSubwaySP
//
//  Created by Luana Moraes on 06/11/23.
//

import SwiftUI


struct HomeView: View {
    
//    @State private var currentZoom = 0.0
//    @State private var totalZoom = 1.0
    
    var body: some View {
        GeometryReader { geo in
            Image("linha-prata")
                .resizable()
                .scaledToFill()
                .frame(width: geo.size.width, height: geo.size.height)
                .modifier(ImageModifier(contentSize: CGSize(width: geo.size.width, height: geo.size.height)))
            
            
        }
        
    }
}

#Preview {
    HomeView()
}
