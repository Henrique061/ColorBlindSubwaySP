//
//  ConnectorMapComponent.swift
//  ColorBlindSubwaySP
//
//  Created by Henrique Assis on 13/11/23.
//

import SwiftUI

struct ConnectorMapComponent: View {
    let imageName: String
    let geometryProxy: GeometryProxy
    let positionMultiplier: CGPoint
    let rotation: CGFloat
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .scaleEffect(0.017)
            .rotationEffect(.degrees(rotation))
            .position(x: geometryProxy.size.width * positionMultiplier.x, y: geometryProxy.size.height * positionMultiplier.y)
    }
}
