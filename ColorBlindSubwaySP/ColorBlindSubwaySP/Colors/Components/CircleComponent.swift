//
//  CircleComponent.swift
//  ColorBlindSubwaySP
//
//  Created by Luana Moraes on 10/11/23.
//

import SwiftUI

struct CircleComponent: View {
    @Environment(\.screenSize) var screenSize
    var mapVm: MapViewModel
    var circleType: LineCase
    @Binding var circleColor: Color
    
    init(mapVm: MapViewModel, circleType: LineCase) {
        self.mapVm = mapVm
        self.circleType = circleType
        self._circleColor = mapVm.bindingLineColor(for: circleType)
    }
    
    var body: some View {
        
        VStack {
            Circle()
                .fill(circleColor)
                .shadow(radius: screenSize.width * 0.005, y: screenSize.height * 0.005)
                .frame(width: screenSize.width * 0.127, alignment: .center)
                .padding()
                .overlay {
                    ColorPicker("", selection: mapVm.bindingLineColor(for: circleType))
                        .labelsHidden()
                        .opacity(0.015)
                        .scaleEffect(2)
                }
            
            Text(circleType.title)
                .font(.system(size: screenSize.width * 0.030).weight(.bold))
        }
        
        
    }
}
