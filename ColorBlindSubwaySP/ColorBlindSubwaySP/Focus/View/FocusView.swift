//
//  FocusView.swift
//  ColorBlindSubwaySP
//
//  Created by Henrique Assis on 27/11/23.
//

import SwiftUI

struct FocusView: View {
    @ObservedObject var mapVm: MapViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Foco por linha")
                    .font(.system(size: 22).weight(.bold))
                
                Spacer()
            }.padding()
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 3), count: 4), spacing: 3) {
                ForEach(LineCase.allCases, id: \.self) { type in
                    LineFocusComponent(
                        mapVm: mapVm,
                        circleType: type
                    )
                }
            }
            
        }
        .padding()
        Spacer()
    }
}
