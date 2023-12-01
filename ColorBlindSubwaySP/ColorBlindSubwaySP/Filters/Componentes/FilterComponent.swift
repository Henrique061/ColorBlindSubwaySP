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
    
    var body: some View {
        VStack {
            Circle()
                .fill(filterColor)
                .frame(width: screenSize.width * 0.127, alignment: .center)
                .padding(10)
            
            Text(filterName)
                .font(.system(size: screenSize.width * 0.030).weight(.semibold))
        }
        
    }
}
