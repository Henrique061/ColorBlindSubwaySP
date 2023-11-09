//
//  LineComponent.swift
//  ColorBlindSubwaySP
//
//  Created by Henrique Assis on 08/11/23.
//

import SwiftUI

struct LineComponent: View {
    let imageName: String
    let geometryProxy: GeometryProxy
    let initialScale: CGFloat
    let positionMultiplier: CGPoint
    
    @Binding var lineColor: Color
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .scaleEffect(initialScale)
            .colorMultiply(lineColor)
            .position(x: geometryProxy.size.width * positionMultiplier.x, y: geometryProxy.size.height * positionMultiplier.y)
    }
}
