//
//  CircleComponent.swift
//  ColorBlindSubwaySP
//
//  Created by Luana Moraes on 10/11/23.
//

import SwiftUI

struct CircleComponent: View {
    
    var circleType: CircleType
    
    var body: some View {
        
        VStack {
            Circle()
                .fill(circleType.color)
                .shadow(radius: 2, y: 4)
                .frame(width: 60)
                .padding()
            Text(circleType.title)
                .font(.system(size: 13).weight(.bold))
        }
        
        
    }
}

//#Preview {
//    CircleComponent(circleType: <#CircleType#>)
//}
