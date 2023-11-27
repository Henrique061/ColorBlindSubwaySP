//
//  LineFocusComponent.swift
//  ColorBlindSubwaySP
//
//  Created by Henrique Assis on 27/11/23.
//

import SwiftUI

struct LineFocusComponent: View {
    var mapVm: MapViewModel
    var line: LineCase
    @Binding var circleColor: Color
    
    init(mapVm: MapViewModel, circleType: LineCase) {
        self.mapVm = mapVm
        self.line = circleType
        self._circleColor = mapVm.bindingLineColor(for: circleType)
    }
    
    var body: some View {
        
        VStack {
            Button {
                self.mapVm.changeLineOpacity(line: line)
            } label: {
                Circle()
                    .fill(circleColor)
                    .shadow(radius: 2, y: 4)
                    .frame(width: 50, alignment: .center)
                    .padding()
            }
            
            Text(line.title)
                .font(.system(size: 12).weight(.bold))
        }
    }
}
