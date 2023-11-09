//
//  MapView.swift
//  ColorBlindSubwaySP
//
//  Created by Henrique Assis on 08/11/23.
//

import SwiftUI

struct MapView: View {
    @State var color: Color = Color.blue
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                LineComponent(
                    imageName: "LinhaAzul",
                    geometryProxy: proxy,
                    initialScale: 0.3,
                    positionMultiplier: .init(x: 0.33, y: 0.5),
                    lineColor: $color
                )
            }
            //.position(x: proxy.size.width * 0.5, y: proxy.size.height * 0.5)
        }
        .aspectRatio(contentMode: .fill)
        
        ColorPicker("", selection: $color)
    }
}

#Preview {
    MapView()
}
