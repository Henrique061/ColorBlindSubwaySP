//
//  LineMapComponent.swift
//  ColorBlindSubwaySP
//
//  Created by Henrique Assis on 09/11/23.
//

import SwiftUI

struct LineMapComponent: View {
    let imageName: String
    let geometryProxy: GeometryProxy
    let initialScale: CGFloat
    let positionMultiplier: CGPoint
    
    @Binding var lineColor: Color
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .scaleEffect(1)
            .colorMultiply(lineColor)
            .position(x: geometryProxy.size.width * positionMultiplier.x, y: geometryProxy.size.height * positionMultiplier.y)
    }
}
