//
//  MapView.swift
//  ColorBlindSubwaySP
//
//  Created by Henrique Assis on 08/11/23.
//

import SwiftUI

struct MapView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("Rubi")
                    .resizable()
                    .scaledToFill()
                    .colorMultiply(.red)
                    .position(x: geo.size.width * 0.5, y: geo.size.height * 0.5)
            }
            .position(x: geo.size.width * 0.5, y: geo.size.height * 0.5)
        }
        .aspectRatio(contentMode: .fill)
    }
}

#Preview {
    MapView()
}
