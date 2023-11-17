//
//  FilterComponent.swift
//  ColorBlindSubwaySP
//
//  Created by Caroline Stelitano on 17/11/23.
//

import SwiftUI

struct FilterComponent: View {
    let filterColor: Color
    let filterName: String
    
    var body: some View {
        VStack {
            //criar como botao!!
            Circle()
                .fill(filterColor)
                .frame(width: 50)
                .padding(10)
            
            Text(filterName)
                .font(.system(size: 15).weight(.semibold))
        }
        
    }
}
