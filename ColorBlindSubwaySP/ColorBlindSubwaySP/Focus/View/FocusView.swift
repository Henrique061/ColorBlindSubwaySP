//
//  FocusView.swift
//  ColorBlindSubwaySP
//
//  Created by Henrique Assis on 27/11/23.
//

import SwiftUI

struct FocusView: View {
    @Environment(\.screenSize) var screenSize
    @ObservedObject var mapVm: MapViewModel
    let isIPad = UIDevice.current.userInterfaceIdiom == .pad
    
    var body: some View {
        VStack {
            HStack {
                Text("Foco por linha")
                    .font(.system(size: screenSize.width * 0.056).weight(.bold))
                    .padding(.horizontal, isIPad ? screenSize.width * 0.024 : screenSize.width * 0.007)
                
                Spacer()
                
                Button {
                    self.mapVm.clearAllFocused()
                } label: {
                    Text("Limpar")
                        .foregroundStyle(.white)
                        .font(.system(size: screenSize.width * 0.038))
                        .background(
                            Capsule()
                                .fill(.black)
                                .frame(width: screenSize.width * 0.203, height: screenSize.height * 0.039)
                        )
                }
                .padding(.horizontal, isIPad ? screenSize.width * 0.073 : screenSize.width * 0.025)
            }
            .padding()
            
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
