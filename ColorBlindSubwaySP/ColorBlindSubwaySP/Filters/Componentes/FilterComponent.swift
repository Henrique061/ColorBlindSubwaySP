//
//  FilterComponent.swift
//  ColorBlindSubwaySP
//
//  Created by Caroline Stelitano on 17/11/23.
//

import SwiftUI

struct FilterComponent: View {
    @Environment(\.screenSize) var screenSize
    
    let filterColor: Color
    let filterName: String
    let hasBorder: Bool
    
    var body: some View {
        VStack {
            Circle()
                .fill(filterColor)
                .frame(width: screenSize.width * 0.127, alignment: .center)
                .border(Color.black, width: hasBorder ? 2 : 0)
                .padding(10)
            
            
            Text(filterName)
                .font(.system(size: screenSize.width * 0.030).weight(.semibold))
        }
        
    }
}
