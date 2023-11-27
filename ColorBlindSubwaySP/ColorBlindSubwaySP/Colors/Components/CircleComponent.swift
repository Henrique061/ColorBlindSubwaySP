//
//  CircleComponent.swift
//  ColorBlindSubwaySP
//
//  Created by Luana Moraes on 10/11/23.
//

import SwiftUI

struct CircleComponent: View {
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
                .shadow(radius: 2, y: 4)
                .frame(width: 50, alignment: .center)
                .padding()
                .overlay {
                    ColorPicker("", selection: mapVm.bindingLineColor(for: circleType))
                        .labelsHidden()
                        .opacity(0.015)
                        .scaleEffect(2)
                }
            
            Text(circleType.title)
                .font(.system(size: 12).weight(.bold))
        }
        
        
    }
}

//#Preview {
//    CircleComponent(circleType: <#CircleType#>)
//}
